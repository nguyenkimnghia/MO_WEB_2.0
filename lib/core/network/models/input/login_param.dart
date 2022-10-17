import 'dart:convert';

class LoginParam {
  final String aesKey;
  final String data;

  LoginParam({
      required this.aesKey,
      required this.data});
  Map<String, dynamic> toJson() => {
    "aesKey": aesKey,
    "data": data,
  };

  static String paramToJson(LoginParam data) => json.encode(data.toJson());
}

class DataInput {
  final String loginName;

  DataInput({
    required this.loginName,
  });

  Map<String, dynamic> toJson() => {
        "loginName": loginName,
      };

  static String paramToJson(DataInput data) => json.encode(data.toJson());
}
