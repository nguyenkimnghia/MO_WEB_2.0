import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/controllers/navigator/main_navigator.dart';
import 'package:moffice_web/core/network/services/services.exports.dart';
import 'package:moffice_web/di/di.exports.dart';
import 'package:moffice_web/helpers/store/store.exports.dart';

class UserHelper {

  static void logoutMO() {
    // 1. Xóa tất cả data local của phiên đăng nhập trên ram
    StorageCached.localStorage.removeAll();
    // 2. Thực hiện stop tất cả các request đang connect
    AppInjector.injector<DioClient>().stopAllRequest();
    // 3. Chuyển sang màn hình login
    AppInjector.injector<MainNavigator>().pushNamedAndRemoveUntil(WebRouter.login);
  }
}