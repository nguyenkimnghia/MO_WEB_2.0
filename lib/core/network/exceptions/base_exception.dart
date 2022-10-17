class ExceptionType {
  /// [ExceptionType] Định nghĩa các kiểu lỗi
  ExceptionType();

  /// [request] Các lỗi liên quan đến request
  static const int request = 1;

  /// [logic] Các lỗi liên quan đến xử lý logic ở client
  static const int logic = 2;

  /// [format] Các lỗi format JSon.....
  static const int format = 3;

  /// [unknow] Các lỗi không xác định
  static const int unknow = 3;

  /// [fileIO] các lỗi liên quan đến xử lý file
  static const int fileIO = 4;

  static getName(int type) {
    if (type == request) {
      return 'request';
    }
    if (type == logic) {
      return 'logic';
    }
    if (type == format) {
      return 'format';
    }
    if (type == unknow) {
      return 'unknow';
    }
    if (type == fileIO) {
      return 'fileIO';
    }

    return 'unknow';
  }
}

class ExceptionCode {
  /// [requestConnect] Lỗi connect, receive, timeout của request
  static const int requestConnect = 0;

  /// [requestNoInternet] không có kết nối mạng
  static const int requestNoInternet = 1;

  /// [requestUnknow] lỗi không xác định
  static const int requestUnknow = 2;

  /// [requestErrorResponse] các lỗi http code khác [200]
  static const int requestErrorResponse = 3;

  /// [fileIoRead] Lỗi đọc file
  static const int fileIoRead = 4;

  /// [fileIoWrite] Lỗi ghi file
  static const int fileIoWrite = 5;

  /// [fileIoDownload] Lỗi download file
  static const int fileIoDownload = 6;

  static getName(int code) {
    if (code == requestConnect) {
      return 'requestConnect';
    }
    if (code == requestNoInternet) {
      return 'requestNoInternet';
    }
    if (code == requestUnknow) {
      return 'requestUnknow';
    }
    if (code == requestErrorResponse) {
      return 'requestErrorResponse';
    }
    if (code == fileIoRead) {
      return 'fileIoRead';
    }

    if (code == fileIoWrite) {
      return 'fileIoWrite';
    }
    if (code == fileIoDownload) {
      return 'fileIoDownload';
    }
    return 'unknow';
  }
}

class BaseException implements Exception {
  final int type;
  final int code;
  final String message;

  BaseException({required this.type, required this.code, required this.message})
      : super();

  @override
  String toString() =>
      'BaseException(type: $type, code: $code, message: $message)';
}

class FileIOException extends BaseException {
  FileIOException(
      {required int type, required int code, required String message})
      : super(type: type, code: code, message: message);

  @override
  String toString() =>
      'FileIOException(type: $type, code: $code, message: $message)';
}
