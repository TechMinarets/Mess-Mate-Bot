import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();

  /// Dio Exception
  const factory Failure.cancelException({required String message}) =
      CancelException;

  const factory Failure.connectionTimeoutException({required String message}) =
      ConnectionTimeoutException;

  const factory Failure.receiveTimeoutException({required String message}) =
      ReceiveTimeoutException;

  const factory Failure.sendTimeoutException({required String message}) =
      SendTimeoutException;

  const factory Failure.socketException({required String message}) =
      SocketException;

  const factory Failure.unrecognizedException({required String message}) =
      UnrecognizedException;

  const factory Failure.tokenExpiredException({required String message}) =
      TokenEpiredException;

  const factory Failure.serverException({
    required String message,
    required int statusCode,
    dynamic data,
  }) = ServerException;

  /// Format Exception
  const factory Failure.formatException({required String message}) =
      FormatException;

  /// Serialization Exception
  const factory Failure.serializationException({required String message}) =
      SerializationException;
}
