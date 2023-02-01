import 'package:dio/dio.dart';

import '../session/session_service.dart';

class GlobalInterceptor extends Interceptor {
  GlobalInterceptor(this.dio);

  final Dio dio;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = SessionService().getToken();
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.requestOptions, err.response);
          case 401:
            if (err.response.toString().contains('token expired')) {
              throw RefreshTokenRequiredException(err.requestOptions);
            }
            throw UnauthorizedException(err.requestOptions, err.response);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException(err.requestOptions);
    }
    return handler.next(err);
  }
}


class BadRequestException extends DioError {
  BadRequestException(RequestOptions r, this.response)
      : super(requestOptions: r);

  final Response<dynamic>? response;

  @override
  String toString() => 'Invalid request';
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => 'Unknown error occurred, please try again later.';
}

class RefreshTokenRequiredException extends DioError {
  RefreshTokenRequiredException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => 'Please wait, we need to refresh your session.';
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => 'Conflict occurred';
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r, this.response)
      : super(requestOptions: r);

  final Response<dynamic>? response;

  String getMessage() => 'Access denied';
    
  @override
  String toString() => getMessage();
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => 'The requested information could not be found';
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => 'No internet connection detected, please try again.';
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() => 'The connection has timed out, please try again.';
}
