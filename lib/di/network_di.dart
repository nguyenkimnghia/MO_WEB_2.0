import 'package:get_it/get_it.dart';
import 'package:moffice_web/core/network/services/services.exports.dart';

class NetWorkDI {
  NetWorkDI._();

  static Future<void> init(GetIt injector) async {
    GetIt.instance.registerFactory<DioClient>(() => DioClient());
  }
}
