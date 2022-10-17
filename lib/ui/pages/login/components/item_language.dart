import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';

class ItemLanguage extends StatelessWidget {
  final String textLanguage;
  final bool isVi;
  final String icon;
  final GestureTapCallback tapEvent;

  const ItemLanguage({
    Key? key,
    required this.textLanguage,
    required this.isVi,
    required this.icon,
    required this.tapEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      child: Container(
        margin: const EdgeInsets.only(right: Dimens.size20),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: Dimens.size20,
              height: Dimens.size20,
            ),
            const SizedBox(width: 6),
            Text(
              textLanguage,
              style:
              TextStyle(
                  fontSize: Dimens.size14,
                  color: isVi ? ColorConst.mainColor : ColorConst.hintTextColorLogin,
                  fontWeight: isVi ? FontWeight.bold : FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
