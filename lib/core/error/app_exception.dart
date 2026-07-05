class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {this.code});

  @override
  String toString() => "AppException: $message (code: $code)";
}

class NetworkException extends AppException {
  NetworkException(super.message, {super.code});
}

class ServerException extends AppException {
  ServerException(super.message, {super.code});
}

class CacheException extends AppException {
  CacheException(super.message, {super.code});
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException(super.message, {super.code});
}

class UnknownException extends AppException {
  UnknownException(super.message, {super.code});
}
