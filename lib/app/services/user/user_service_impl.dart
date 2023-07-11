import 'package:firebase_auth/firebase_auth.dart';

import '../../core/exceptions/failure.dart';
import '../../core/exceptions/user_exists_exception.dart';
import '../../core/exceptions/user_not_exists_exception.dart';
import '../../core/helpers/constants.dart';
import '../../core/local_storage/local_storage.dart';
import '../../core/logger/app_logger.dart';
import '../../models/social_login_type.dart';
import '../../models/social_network_model.dart';
import '../../repositories/social/social_repository.dart';
import '../../repositories/user/user_repository.dart';
import './user_service.dart';

class UserServiceImpl extends UserService {
  final UserRepository _userRepository;
  final AppLogger _log;
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStorage;
  final SocialRepository _socialRepository;

  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger log,
    required LocalStorage localStorage,
    required LocalSecureStorage localSecureStorage,
    required SocialRepository socialRepository,
  })  : _log = log,
        _userRepository = userRepository,
        _localStorage = localStorage,
        _localSecureStorage = localSecureStorage,
        _socialRepository = socialRepository;

  @override
  Future<void> register(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final userMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userMethods.isNotEmpty) {
        throw UserExistsException();
      }

      await _userRepository.register(email, password);
      final userRegisterCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userRegisterCredential.user?.sendEmailVerification();
    } on FirebaseException catch (e, s) {
      _log.error('Erro ao criar usuário no Firebase', e, s);
      throw Failure(message: 'Erro ao criar usuário');
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final userMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userMethods.isEmpty) {
        throw UserNotExistsException();
      }

      if (userMethods.contains('password')) {
        final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        final userVerified = userCredential.user?.emailVerified ?? false;

        if (!userVerified) {
          userCredential.user?.sendEmailVerification();
          throw Failure(message: 'Email não confirmado, por favor verifique sua caixa de spam');
        }

        final accessToken = await _userRepository.login(email, password);

        await _saveAccessToken(accessToken);
        await _confirmLogin();
        await _getUserData();
      } else {
        throw Failure(message: 'Login não pode ser feito por email e senha, por favor utilize outro método');
      }
    } on FirebaseAuthException catch (e, s) {
      _log.error('Usuário ou senha inválidos FirebaseAuthError: ${e.code}', e, s);
      throw Failure(message: 'Usuário ou senha inválidos');
    }
  }

  @override
  Future<void> socialLogin(SocialLoginType socialLoginType) async {
    try {
      final SocialNetworkModel socialModel;
      final AuthCredential authCredential;
      final firebaseAuth = FirebaseAuth.instance;

      switch (socialLoginType) {
        case SocialLoginType.facebook:
          socialModel = await _socialRepository.facebookLogin();
          authCredential = FacebookAuthProvider.credential(socialModel.accessToken);
          break;
        case SocialLoginType.google:
          socialModel = await _socialRepository.googleLogin();
          authCredential = GoogleAuthProvider.credential(
            accessToken: socialModel.accessToken,
            idToken: socialModel.id,
          );
          break;
      }

      final userMethods = await firebaseAuth.fetchSignInMethodsForEmail(socialModel.email);
      final methodUrl = _getMethodToSocialLoginType(socialLoginType)['methodUrl'];
      final methodName = _getMethodToSocialLoginType(socialLoginType)['methodName'];

      if (userMethods.isNotEmpty && !userMethods.contains(methodUrl)) {
        throw Failure(message: 'Login não pode ser feito por $methodName, por favor utilize outro método');
      }

      await firebaseAuth.signInWithCredential(authCredential);
      final accessToken = await _userRepository.socialLogin(socialModel);
      await _saveAccessToken(accessToken);
      await _confirmLogin();
      await _getUserData();
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao realizar login com $socialLoginType', e, s);
      throw Failure(message: 'Erro ao realizar login');
    }
  }

  Future<void> _saveAccessToken(String accessToken) async {
    await _localStorage.write<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY, accessToken);
  }

  Future<void> _confirmLogin() async {
    final confirmLoginModel = await _userRepository.confirmLogin();
    await _saveAccessToken(confirmLoginModel.accessToken);
    await _localSecureStorage.write(Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY, confirmLoginModel.refreshToken);
  }

  Future<void> _getUserData() async {
    final userModel = await _userRepository.getUserLogged();
    await _localStorage.write<String>(Constants.LOCAL_STORAGE_USER_LOGGED_DATA_KEY, userModel.toJson());
  }

  Map<String, String> _getMethodToSocialLoginType(SocialLoginType socialLoginType) {
    switch (socialLoginType) {
      case SocialLoginType.facebook:
        return {
          'methodUrl': 'facebook.com',
          'methodName': 'Facebook',
        };
      case SocialLoginType.google:
        return {
          'methodUrl': 'google.com',
          'methodName': 'Google',
        };
    }
  }
}
