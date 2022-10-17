import 'package:get_it/get_it.dart';
import 'package:moffice_web/core/network/repositories/repositories.exports.dart';

class ServiceDI {
  ServiceDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerSingleton<LoginRepositories>(LoginRepositories());
  }
}
