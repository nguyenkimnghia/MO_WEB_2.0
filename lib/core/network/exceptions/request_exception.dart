import 'package:dio/dio.dart';
import 'base_exception.dart';

class RequestException extends DioError {
  @override
  final String message;

  final int code;

  final int typeE;

  final DioError dioE;

  RequestException(
      {required this.dioE,
      required this.message,
      this.typeE = ExceptionType.request,
      this.code = ExceptionCode.requestUnknow})
      : super(
          requestOptions: dioE.requestOptions,
          response: dioE.response,
          type: dioE.type,
          error: dioE.error,
        );

  @override
  String toString() {
    return 'RequestException(message: $message,typeE: [$typeE][${ExceptionType.getName(typeE)}], code: [$code][${ExceptionCode.getName(code)}], dioE: ${dioE.toString()})';
  }
}
