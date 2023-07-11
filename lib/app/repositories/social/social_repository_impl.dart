import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/exceptions/failure.dart';
import '../../models/social_network_model.dart';
import './social_repository.dart';

class SocialRepositoryImpl extends SocialRepository {
  @override
  Future<SocialNetworkModel> facebookLogin() async {
    final facebookSignIn = FacebookAuth.instance;
    final result = await facebookSignIn.login();

    switch (result.status) {
      case LoginStatus.success:
        final userData = await facebookSignIn.getUserData();
        return SocialNetworkModel(
          id: userData['id'],
          name: userData['name'],
          email: userData['email'],
          type: 'Facebook',
          avatar: userData['picture']['data']['url'],
          accessToken: result.accessToken?.token ?? '',
        );
      case LoginStatus.cancelled:
        throw Failure(message: 'Login cancelado');
      case LoginStatus.failed:
      case LoginStatus.operationInProgress:
        throw Failure(message: result.message);
    }
  }

  @override
  Future<SocialNetworkModel> googleLogin() async {
    final googleSignIn = GoogleSignIn();

    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.disconnect();
    }

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;

    if (googleAuth != null && googleUser != null) {
      return SocialNetworkModel(
        id: googleAuth.idToken ?? '',
        name: googleUser.displayName ?? '',
        email: googleUser.email,
        type: 'Google',
        avatar: googleUser.photoUrl,
        accessToken: googleAuth.accessToken ?? '',
      );
    } else {
      throw Failure(message: 'Erro ao realizar login com o Google');
    }
  }
}
