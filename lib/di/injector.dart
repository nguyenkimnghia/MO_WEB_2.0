import 'package:get_it/get_it.dart';
import 'di.exports.dart';

class AppInjector {
  AppInjector._();

  static final injector = GetIt.instance;

  static Future<void> initializeDependencies() async {
    await NetWorkDI.init(injector);
    await ServiceDI.init(injector);
    await BlocDI.init(injector);
    await PageDI.init(injector);
    await ControllerDI.init(injector);
  }
}
