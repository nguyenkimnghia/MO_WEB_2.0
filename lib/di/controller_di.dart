import 'package:get_it/get_it.dart';
import 'package:moffice_web/controllers/navigator/navigator.exports.dart';

class ControllerDI {
  ControllerDI._();
  static Future<void> init(GetIt injector) async {
    injector.registerSingleton<MainNavigator>(MainNavigator());
  }
}
