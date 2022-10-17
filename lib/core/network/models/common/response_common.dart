import 'dart:convert';

class ResponseCommon {
  final String errorCode;
  final bool isSecurity;
  final String message;
  dynamic data;
  ResponseCommon({
    required this.errorCode,
    required this.isSecurity,
    required this.message,
    required this.data,
  });

  ResponseCommon copyWith({
    String? errorCode,
    bool? isSecurity,
    String? message,
    dynamic data,
  }) {
    return ResponseCommon(
      errorCode: errorCode ?? this.errorCode,
      isSecurity: isSecurity ?? this.isSecurity,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'errorCode': errorCode,
      'isSecurity': isSecurity,
      'message': message,
      'data': data,
    };
  }

  factory ResponseCommon.fromMap(Map<String, dynamic> map) {
    return ResponseCommon(
      errorCode: map['errorCode'] ?? '',
      isSecurity: map['isSecurity'] ?? false,
      message: map['message'] ?? '',
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseCommon.fromJson(String source) =>
      ResponseCommon.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResponseCommon(errorCode: $errorCode, isSecurity: $isSecurity, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseCommon &&
        other.errorCode == errorCode &&
        other.isSecurity == isSecurity &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode {
    return errorCode.hashCode ^
        isSecurity.hashCode ^
        message.hashCode ^
        data.hashCode;
  }
}
