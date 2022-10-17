import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  /// This [ToastUtils] for show snackbar message event
  ///
  /// The [showToastSuccess]
  ///
  /// The [showSnackBar]
  ///
  /// The [showToast]
  ///
  /// The [showToastError]
  ToastUtils();

  static showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  /// The [showToastSuccess] show message with success event
  ///
  /// Params [msg] msg for show, [position] [ToastGravity] position show msg, [inTime] [Toast] time for show
  static Future<bool?> showToastSuccess(String msg,
      {position = ToastGravity.BOTTOM, inTime = Toast.LENGTH_LONG, timeShow = 3}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: inTime,
        gravity: position,
        timeInSecForIosWeb: timeShow,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  /// The [showToastError] show message with error event
  ///
  /// Params [msg] msg for show, [position] [ToastGravity] position show msg, [inTime] [Toast] time for show
  static Future<bool?> showToastError(String msg,
      {ToastGravity position = ToastGravity.BOTTOM,
      Toast inTime = Toast.LENGTH_LONG}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: inTime,
        gravity: position,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
