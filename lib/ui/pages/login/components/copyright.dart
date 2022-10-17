import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';

class Copyright extends StatelessWidget {
  const Copyright({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          margin: const EdgeInsets.only(bottom: Dimens.size17),
          child:  Text(AppLocalizations.of(context).translate("coppyright"),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: Dimens.size12,
                  fontWeight: FontWeight.w400
              ))
      ),
    );
  }
}
