import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:messmatebot/domain/model/core/failure.dart';

class DioExceptionMapper {
  /// Parse Dio Exception
  static Failure mapDioException(Exception exception) {
    debugPrint(exception.toString());
    debugPrintStack();
    try {
      if (exception is DioException) {
        switch (exception.type) {
          case DioExceptionType.connectionTimeout:
            return const Failure.connectionTimeoutException(
              message: 'Connection not established',
            );
          case DioExceptionType.sendTimeout:
            return const Failure.sendTimeoutException(
              message: 'Send timeout in connection with API server',
            );
          case DioExceptionType.receiveTimeout:
            return const Failure.receiveTimeoutException(
              message: 'Receive timeout in connection with API server',
            );
          case DioExceptionType.badCertificate:
            return const Failure.socketException(
              message: 'SSL certificate is not valid',
            );
          case DioExceptionType.cancel:
            return const Failure.cancelException(
              message: 'Request to API server was cancelled',
            );
          case DioExceptionType.connectionError:
            return const Failure.socketException(
              message: 'No Internet connection',
            );
          case DioExceptionType.badResponse:
            return Failure.serverException(
              message: exception.response?.statusMessage ??
                  'Bad response from API server',
              statusCode: exception.response?.statusCode ?? 400,
              data: exception.response?.data,
            );
          case DioExceptionType.unknown:
          default:
            return const Failure.unrecognizedException(
              message: 'Unknown error occurred',
            );
        }
      }
    } on FormatException catch (e) {
      return Failure.formatException(message: e.message);
    }
    return const Failure.unrecognizedException(
      message: 'Unknown error occurred',
    );
  }

  /// Parse Serialization Exception
  static Failure mapParsingException(Exception exception) {
    debugPrint(exception.toString());
    debugPrintStack();
    return const Failure.serializationException(
      message: 'Failed to parse network response to model or vice versa.',
    );
  }
}
