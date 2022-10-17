import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:moffice_web/di/di.exports.dart';


class WebConfig {
  static final WebConfig _appConfig = WebConfig._();
  factory WebConfig() {
    return _appConfig;
  }
  WebConfig._();

  Future<void> config() async {
    await AppInjector.initializeDependencies();
    configLoading();
  }

  void configLoading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..maskType = EasyLoadingMaskType.custom
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = Colors.white
      ..indicatorSize = 40.0
      ..radius = 12.0
      ..backgroundColor = Colors.black.withOpacity(0.8)
      ..indicatorColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.2)
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
