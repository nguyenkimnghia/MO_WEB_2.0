import 'package:dio/dio.dart';
import 'package:moffice_web/helpers/store/store.exports.dart';
import 'security.exports.dart';

class RequestHelper {

  static String decryptResponse(String data) {
    return EncryptHelper().aesDecryptFromHexString(
        data,
        StorageCached.localStorage.getString(StorageCached.mKey),
        StorageCached.localStorage.getString(StorageCached.mIV));
  }

  static String encryptParams(String json) {
    return EncryptHelper()
        .AESEncryptFromString(json,
        StorageCached.localStorage.getString(StorageCached.mKey),
        StorageCached.localStorage.getString(StorageCached.mIV));
  }

  static isCancelRequest(Exception e) {
    if (e is! DioError) {
      return false;
    }
    return e.type == DioErrorType.cancel;
  }
}
