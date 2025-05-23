// ignore_for_file: avoid_print

import 'dart:io';

import 'package:sawargi/app/configs/dio/exceptions.dart';
import 'package:dio/dio.dart';

class DioInterceptors extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // print('ERROR STATUS CODE: ${err.response?.statusCode}');
    // print('ERROR STATUS DATA: ${err.response?.data}');

    if (err.error is SocketException) {
      print('YOU ARE NOT CONNECTED');
    } else {
      switch (err.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.connectionError:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw DeadlineExceededException(err.requestOptions, err.response);
        case DioExceptionType.badResponse:
          switch (err.response?.statusCode) {
            case 400:
              throw BadRequestException(err.requestOptions, err.response);
            case 401:
              throw UnauthorizedException(err.requestOptions, err.response);
            case 404:
              throw NotFoundException(err.requestOptions, err.response);
            case 409:
              throw ConflictException(err.requestOptions, err.response);
            case 500:
              throw InternalServerErrorException(
                err.requestOptions,
                err.response,
              );
          }
          break;
        case DioExceptionType.cancel:
          break;
        case DioExceptionType.unknown:
          throw NoInternetConnectionException(err.requestOptions, err.response);
        case DioExceptionType.badCertificate:
      }
    }

    handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // print("--> ${options.method} ${options.uri}");
    // print("Headers: ${options.headers}");
    // print("Body: ${options.data}");
    // String? token = await SecureStorage.readStorage(key: 'token');

    // if (token != null) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print("<-- ${response.statusCode} ${response.requestOptions.uri}");
    // print("Headers: {${response.headers}}");
    // print("Response: ${response.data}");

    handler.next(response);
  }
}
