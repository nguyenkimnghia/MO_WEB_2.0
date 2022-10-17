import 'package:moffice_web/constants/constants.exports.dart';

class ApiConst {
  /*{
    - [APPROVE_SIGN] danh sách ký duyệt
    - [DETAIL_SIGN_BY_ID] Chi tiết ký duyệt lấy bởi ID
    - [DETAIL_ATTACH_BY_ID] Lấy danh sách file đính kèm bởi ID
    - [DETAIL_SIGN_INFO] Lấy thông tin những thông tin về ý kiến cán bộ, xét duyệt, ký duyệt, ký nháy
    - [SIGN_ACCEPT] Ký đồng ý văn bản bao gồm ,ký thường: ký thường: [SignType.signNormal], ký CA [SignType.signRemoteCA], ký remote [SignType.signRemote]
    - [SIGN_REJECT] Ký từ chối
  }*/
// ========================API==================================================
  // SIGN
  static const String getPublicKey = "auth/v1.0/get-public-key";
  static const String countDigitalSign = "sign/v1.0/home/text-count-web";

  //DOCUMENT
  static const String countDocument = "document/v1.0/count-document";

  // FILE
  static const String downloadFile = "file/v1.0/download";

  // COMMON
  static const String getUserInfoById = "user/v1.0/users";
  static const String getUserInfo = "user/v1.0/info";
  static const String search_emp = "search/v1.0/emp-search";



// ========================SERVICES=============================================


  // Service Authen
  static List<String> endPointAuthentication = [
    getPublicKey,
  ];

  // Service Sign
  static List<String> endPointSign = [
    countDigitalSign,
  ];

  // Service file
  static List<String> endPointFile = [
    downloadFile
  ];

  // Service common
  static List<String> endPointCommon = [
    search_emp,
    getUserInfo,
    getUserInfoById
  ];

  // Service document
  static List<String> endPointDocument = [
    countDocument,
  ];

  static String getEndPointService(String api) {
    String baseUrl = "";
    if (endPointAuthentication.contains(api)) {
      return EnvConstants.getEnvValue(Config.baseUrlAuthen);
    }

    if (endPointSign.contains(api)) {
      return EnvConstants.getEnvValue(Config.baseUrlSign);
    }

    if (endPointFile.contains(api)) {
      return EnvConstants.getEnvValue(Config.baseUrlFile);
    }
    if (endPointCommon.contains(api)) {
      return EnvConstants.getEnvValue(Config.baseUrlCommon);
    }
    if (endPointDocument.contains(api)) {
      return EnvConstants.getEnvValue(Config.baseUrlDocument);
    }

    return baseUrl;
  }
}

class NetworkConst {
  // status code https
  static const int statusCodeSuccess = 200;
  static const int statusCodeBadRequest = 400;
  static const int statusCodeUnauthorized = 401;
  static const int statusCodeNotFound = 404;

  // errorCode server Moffice
  static const String e000Success = "000";

  // status code server keycloak
  static const int keycloakRequestSuccess = 200;
  static const int keycloakRequestUnauthorized = 401;
  static const int keycloakRequestBad = 403;
  static const int keycloakRequestConnectionTimeout = 60;

}
