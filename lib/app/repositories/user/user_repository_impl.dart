import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/exceptions/failure.dart';
import '../../core/exceptions/user_exists_exception.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/rest_client/rest_client_exception.dart';
import '../../models/confirm_login_model.dart';
import '../../models/social_network_model.dart';
import '../../models/user_model.dart';
import './user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final RestClient _restClient;
  final AppLogger _log;

  UserRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _restClient.unauth().post('/auth/register', data: {
        'email': email,
        'password': password,
      });
    } on RestClientException catch (e, s) {
      if (e.statusCode == 400 && e.response.data['message'].contains('Usuário já cadastrado')) {
        _log.error(e.error, e, s);
        throw UserExistsException();
      }

      const errorMessage = 'Erro ao cadastrar usuário';
      _log.error(errorMessage, e, s);
      throw Failure(message: errorMessage);
    }
  }

  @override
  Future<String> login(String email, String password) async {
    try {
      final result = await _restClient.unauth().post('/auth/', data: {
        'login': email,
        'password': password,
        'social_login': false,
        'supplier_user': false,
      });

      return result.data['access_token'];
    } on RestClientException catch (e, s) {
      if (e.statusCode == 403) {
        throw Failure(message: 'Usuário inconsistente, entre em contato o suporte');
      }
      const errorMessage = 'Erro ao realizar login';
      _log.error(errorMessage, e, s);
      throw Failure(message: errorMessage);
    }
  }

  @override
  Future<ConfirmLoginModel> confirmLogin() async {
    try {
      final deviceToken = await FirebaseMessaging.instance.getToken();

      final result = await _restClient.auth().patch('/auth/confirm', data: {
        'ios_token': Platform.isIOS ? deviceToken : null,
        'android_token': Platform.isAndroid ? deviceToken : null,
      });

      return ConfirmLoginModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      const errorMessage = 'Erro ao confirmar login';
      _log.error(errorMessage, e, s);
      throw Failure(message: errorMessage);
    }
  }

  @override
  Future<UserModel> getUserLogged() async {
    try {
      final result = await _restClient.get('/user/');
      return UserModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      const errorMessage = 'Erro ao buscar dados do usuário logado';
      _log.error(errorMessage, e, s);
      throw Failure(message: errorMessage);
    }
  }

  @override
  Future<String> socialLogin(SocialNetworkModel model) async {
    try {
      final result = await _restClient.unauth().post('/auth/', data: {
        'login': model.email,
        'social_login': true,
        'avatar': model.avatar,
        'social_type': model.type,
        'social_key': model.id,
        'supplier_user': false,
      });

      return result.data['access_token'];
    } on RestClientException catch (e, s) {
      if (e.statusCode == 403) {
        throw Failure(message: 'Usuário inconsistente, entre em contato o suporte');
      }
      const errorMessage = 'Erro ao realizar login';
      _log.error(errorMessage, e, s);
      throw Failure(message: errorMessage);
    }
  }
}
