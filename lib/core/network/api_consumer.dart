import 'package:dio/dio.dart';
import 'package:filmology/core/network/auth_interceptor.dart';

class ApiConsumer {
  late final Dio _dio;

  ApiConsumer(String baseUrl) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 45),
        receiveTimeout: const Duration(seconds: 45),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      AuthInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true, error: true),
    ]);
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> post(String path, {dynamic data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> postWithFile(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    try {
      final formData = FormData.fromMap(data);
      final response = await _dio.post(path, data: formData);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> update(
    String path, {
    dynamic data,
    bool isPatch = false,
  }) async {
    try {
      final response = await (isPatch
          ? _dio.patch(path, data: data)
          : _dio.put(path, data: data));
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  Future<dynamic> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response.data;
    } on DioException catch (e) {
      _handleError(e);
    }
  }

  void _handleError(DioException e) {
  if (e.response != null) {
    final dynamic errorData = e.response?.data;
    String errorMessage = "حدث خطأ غير متوقع";

    try {
      if (errorData is List && errorData.isNotEmpty) {
        final firstElement = errorData[0];
        if (firstElement is Map) {
          errorMessage = firstElement['error'] ?? firstElement['message'] ?? errorMessage;
        }
      } 
      else if (errorData is Map) {
        errorMessage = errorData['error'] ?? errorData['message'] ?? errorMessage;
      }
    } catch (crash) {
      errorMessage = "خطأ في معالجة البيانات من السيرفر";
    }

    throw Exception(errorMessage);
  } else {
    throw Exception("لا يمكن الاتصال بالسيرفر، يرجى التأكد من الإنترنت");
  }
}}