import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/core/network/services/services.exports.dart';
import 'package:moffice_web/core/security/security.exports.dart';
import 'package:moffice_web/di/di.exports.dart';
import 'package:moffice_web/helpers/store/cache_storage.dart';

class LoginRepositories {

  final DioClient _network = AppInjector.injector<DioClient>();

  Future<ResponseCommon> authenKeyCloak(
      String username, String password) async {
    if (username.contains("member\\")) {
      IdentifierConst.accountType = "member";
      List<String> partAccount = username.split("\\");
      if (partAccount.length > 1) {
        username = partAccount[1];
      }
    } else {
      IdentifierConst.accountType = "bank";
    }
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'cache-control': 'no-cache',
      'Access-Control-Allow-Origin' : '*',
      'Access-Control-Allow-Methods': 'DELETE, POST, GET, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization, X-Requested-With'
    };
    Map<String, dynamic> data = <String, dynamic>{
      'username': username,
      'password': password,
      'client_secret': IdentifierConst.accountType == "bank"
          ? EnvConstants.getEnvValue(Config.clientSecretBank)
          : EnvConstants.getEnvValue(Config.clientSecretMember),
      'client_id': IdentifierConst.accountType == "bank"
          ? EnvConstants.getEnvValue(Config.clientIdBank)
          : EnvConstants.getEnvValue(Config.clientIdMember),
      'grant_type': IdentifierConst.accountType == "bank"
          ? EnvConstants.getEnvValue(Config.grantTypeBank)
          : EnvConstants.getEnvValue(Config.grantTypeMember)
    };
    http.Response response = await http.post(
        Uri.parse(IdentifierConst.accountType == "bank"
            ? EnvConstants.getEnvValue(Config.keyCloakUrlBank)
            : EnvConstants.getEnvValue(Config.keyCloakUrlMember)),
        headers: headers,
        body: data);
    if (response.statusCode == NetworkConst.keycloakRequestSuccess) {
      KeyCloakOutput keyCloakOutput = KeyCloakOutput.fromJson(json.decode(response.body));
      // Lưu accessToken, refreshToken vào localStorage
      StorageCached.localStorage.saveString(StorageCached.accessToken, keyCloakOutput.accessToken);
      StorageCached.localStorage.saveString(StorageCached.refreshToken, keyCloakOutput.refreshToken);
      if (keyCloakOutput.accessToken.isNotEmpty) {
        ResponseCommon responseLogin = await getPublicKeyServer(username);
        return responseLogin;
      }
    } else {
      return throw response.statusCode;
    }
    return throw 'Server error';
  }

  Future<ResponseCommon> getPublicKeyServer(String username) async {
    // getPublicKeyServer
    final response = await _network.get(ApiConst.getPublicKey);
    DataKeyModel filterModel = DataKeyModel.fromJson(response.data);
    // Lưu publicKey vào local storage
    StorageCached.localStorage.saveString(StorageCached.serverPublicKey, filterModel.strPublicKey);
    IdentifierConst.aesKey = AesKeyHelper.createAesKey();
    if (filterModel.strPublicKey.isNotEmpty && IdentifierConst.aesKey.isNotEmpty) {
      ResponseCommon dataLogin = await getUserInfor(username);
      return dataLogin;
    }
    throw Exception('Cannot object');
  }

  Future<ResponseCommon> getUserInfor(String username) async {
    String data = DataInput.paramToJson(DataInput(
      loginName: username,
    ));

    BodyCommonParams bodyCommonParams = BodyCommonParams(
        aesKey: EncryptHelper().encryptRSA(
            StorageCached.localStorage.getString(StorageCached.serverPublicKey),
            IdentifierConst.aesKey),
        data: RequestHelper.encryptParams(data));
    ResponseCommon response = await _network.post(ApiConst.getUserInfo, data: bodyCommonParams);
    return response;
  }
}
