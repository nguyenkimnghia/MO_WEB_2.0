import 'package:get_it/get_it.dart';
import 'package:moffice_web/controllers/blocs/locazation/locazation.exports.dart';
import 'package:moffice_web/controllers/blocs/login/login.exports.dart';

class BlocDI {
  BlocDI._();

  static Future<void> init(GetIt injector) async {
    injector.registerFactory(() => LoginBloc());
    injector.registerFactory(() => LocazationBloc());
  }
}
