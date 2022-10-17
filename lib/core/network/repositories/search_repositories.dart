import 'dart:convert';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/core/network/models/output/search_employ_model.dart';
import 'package:moffice_web/core/network/services/services.exports.dart';
import 'package:moffice_web/core/security/security.exports.dart';
import 'package:moffice_web/di/di.exports.dart';

List<UserInfo> userFormJson(String str) => List<UserInfo>.from(json.decode(str).map((x) => UserInfo.fromJson(x)));

class SearchRepositories {

  final DioClient _network = AppInjector.injector<DioClient>();

  Future<ResultSearchEmployeeModel> onSearchEmp({
    int page = 0,
    int size = 15,
    String keyword = ""
  }) async {
    SearchEmplParams bodyParams = SearchEmplParams(keyWord: keyword);

    ResponseCommon response = await _network.post(ApiConst.search_emp,
        queryParameters: {
          'page': page,
          'size': size,
        },
        data: BodyCommonParams(data: RequestHelper.encryptParams(bodyParams.toJson())));

    if (response.errorCode == NetworkConst.e000Success) {
      response.data = ResultSearchEmployeeModel.fromJson(jsonDecode(response.data));
      return response.data;
    }
    throw Exception("Error");
  }

  Future<UserInfo> getUserInfoById(int userId) async {
    BodyCommonParams body = BodyCommonParams(data: RequestHelper.encryptParams(jsonEncode([userId])));
    ResponseCommon response = await _network.post(ApiConst.getUserInfoById, data: body);
    if (response.errorCode == NetworkConst.e000Success) {
      final Map<String, dynamic> maps = Map.castFrom(json.decode(response.data));
      List<UserInfo> listData = userFormJson(jsonEncode(maps.values.toList()));
      if (listData.isNotEmpty){
        return listData[0];
      }
    }
    throw Exception("Error");
  }
}
