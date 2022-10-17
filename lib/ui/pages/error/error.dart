import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';

class ErrorPage extends StatelessWidget {

  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagesNameConst.getImage(ImagesNameConst.error), width: Dimens.size350,),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context).translate("page_not_found"),
                  style : const TextStyle(fontSize: Dimens.size24)),
            ],
          )
        ],
      ),
    );
  }
}
