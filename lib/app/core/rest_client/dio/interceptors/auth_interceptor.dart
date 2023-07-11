import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../modules/core/auth/auth_store.dart';
import '../../../helpers/constants.dart';
import '../../../local_storage/local_storage.dart';
import '../../../logger/app_logger.dart';

class AuthInterceptor extends Interceptor {
  final LocalStorage _localStorage;
  final AppLogger _log;
  final AuthStore _authStore;

  AuthInterceptor({
    required LocalStorage localStorage,
    required AppLogger log,
    required AuthStore authStore,
  })  : _localStorage = localStorage,
        _log = log,
        _authStore = authStore;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final authRequired = options.extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] ?? false;

    if (authRequired) {
      final accessToken = await _localStorage.read<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY);

      if (accessToken == null) {
        _authStore.logout();
        return handler.reject(
          DioException(
            requestOptions: options,
            error: 'Expired Token',
            type: DioExceptionType.cancel,
          ),
        );
      }

      options.headers['Authorization'] = accessToken;
    } else {
      options.headers.remove('Authorization');
    }

    handler.next(options);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   // TODO: implement onResponse
  //   super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioException err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   super.onError(err, handler);
  // }
}
