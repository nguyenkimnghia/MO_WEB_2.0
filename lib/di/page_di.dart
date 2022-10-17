import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moffice_web/constants/routers_constant.dart';
import 'package:moffice_web/ui/pages/pages.exports.dart';

class PageDI {
  PageDI._();

  static Future<void> init(GetIt injector) async {
    // Screens
    injector.registerFactory<Widget>(() => const Login(), instanceName: WebRouter.login);
    injector.registerFactory<Widget>(() => Home(), instanceName: WebRouter.home);
  }
}
