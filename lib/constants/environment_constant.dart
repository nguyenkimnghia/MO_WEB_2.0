import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConstants {
  static String getEnvValue(String base) {
    return dotenv.env[base]!;
  }
}

class Config {
  static const baseUrlAuthen = "BASE_URL_AUTHEN";
  static const baseUrlSign = "BASE_URL_SIGN";
  static const baseUrlFile = "BASE_URL_FILE";
  static const baseUrlCommon = "BASE_URL_COMMON";
  static const baseUrlDocument = "BASE_URL_DOCUMENT";
  static const connectTimeout = 1000 * 30;
  static const receiveTimeout = 1000 * 30;

  // config keycloak bank
  static const keyCloakUrlBank = "KEY_CLOAK_URL_BANK";
  static const clientSecretBank = "CLIENT_SECRET_BANK";
  static const clientIdBank = "CLIENT_ID_BANK";
  static const grantTypeBank = "GRANT_TYPE_BANK";

  // config keycloak member
  static const keyCloakUrlMember = "KEY_CLOAK_URL_MEMBER";
  static const clientSecretMember = "CLIENT_SECRET_MEMBER";
  static const clientIdMember = "CLIENT_ID_MEMBER";
  static const grantTypeMember = "GRANT_TYPE_MEMBER";
}
