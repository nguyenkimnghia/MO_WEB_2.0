import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/ui/widget/loading/loading.export.dart';

class MonitorLoading implements ILoading {
  static final MonitorLoading _instance = MonitorLoading._internal();

  factory MonitorLoading() {
    return _instance;
  }

  MonitorLoading._internal();

  @override
  void dismiss() {
    EasyLoading.dismiss();
  }

  @override
  void showLoading(String? message) {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 60
      ..textColor = Colors.black
      ..radius = 20
      ..backgroundColor = Colors.transparent
      ..maskColor = Colors.transparent
      ..indicatorColor = Colors.black54
      ..userInteractions = false
      ..dismissOnTap = false
      ..boxShadow = <BoxShadow>[]
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid;

    EasyLoading.show(
      // status: message,
      indicator: LoadingMB(
        title: message ?? "",
        textSize: Dimens.size14,
        assetImage: ImagesNameConst.getImage(ImagesNameConst.logo),
        sizeImage: Dimens.size60,
      ),
    );
  }

  @override
  void showError(String message) {
    EasyLoading.showError(message);
  }

  @override
  void showInfo(String message) {
    EasyLoading.showInfo(message);
  }

  @override
  void showProgress(String? message, double? progress) {
    EasyLoading.showProgress(progress ?? 0, status: message);
  }

  @override
  void showSuccess(String message) {
    EasyLoading.showSuccess(message);
  }

  @override
  void showToast(String message) {
    EasyLoading.showToast(message);
  }
}

abstract class ILoading {
  void showLoading(String? message);

  void dismiss();

  void showProgress(String? message, double? progress);

  void showSuccess(String message);

  void showError(String message);

  void showInfo(String message);

  void showToast(String message);
}
