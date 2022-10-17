import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/core/network/services/services.exports.dart';
import 'package:moffice_web/di/di.exports.dart';

class MainRepositories {

  final DioClient _network = AppInjector.injector<DioClient>();

  //api lấy số lượng văn bản ký điện tử
  Future<ResponseCommon> getCountDigitalSign() async {
    ResponseCommon response = await _network.post(ApiConst.countDigitalSign);
    return response;
  }

  //api lấy số lượng văn bản
  Future<DocumentCountModel> getCountDocument() async {
    ResponseCommon response = await _network.post(ApiConst.countDocument);

    if (response.errorCode == NetworkConst.e000Success) {
      DocumentCountModel documentCountModel = DocumentCountModel.fromJson(response.data);
      return documentCountModel;
    }
    throw Exception('error get');
  }
}