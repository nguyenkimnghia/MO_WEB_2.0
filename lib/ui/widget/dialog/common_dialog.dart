import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog(
      {Key? key,
      required this.child,
      this.width = Dimens.size880,
      this.height = Dimens.size437,
      this.canBackdrop = false})
      : super(key: key);

  /// [child]content dialog;
  final Widget child;

  /// The [height] height of dialog
  final double height;

  ///The [width] width of dialog
  final double width;

  /// The [canBackdrop] canBackdrop = true tap backdrop popup is dismiss
  final bool canBackdrop;

  ///The [show] function show custom dialog
  void show(BuildContext context) {
    showDialog(
        barrierDismissible: canBackdrop,
        context: context,
        builder: (context) => this);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(child: SizedBox(
        width: width,
        height: height,
        child: child));
  }
}
