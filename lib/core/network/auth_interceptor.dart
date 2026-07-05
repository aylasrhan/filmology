import 'package:dio/dio.dart';
import 'package:filmology/core/services/auth_storage_service.dart';

class AuthInterceptor extends Interceptor {
  final AuthStorageService _authStorage = AuthStorageService();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = await _authStorage.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Accept'] = 'application/json';

    return handler.next(options);
  }
}
