import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';

class MainNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateToReplacement(String routerName, {Object? argument}) {
    return navigatorKey.currentState!.pushReplacementNamed(routerName, arguments: argument);
  }

  Future<dynamic> navigateTo(String routerName) {
    return navigatorKey.currentState!.pushNamed(routerName);
  }

  Future<dynamic> navigateToRoute(MaterialPageRoute routerName) {
    return navigatorKey.currentState!.push(routerName);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routerName) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(WebRouter.login, (_) => false);
  }

  void goBack() {
    return navigatorKey.currentState!.pop();
  }

}
