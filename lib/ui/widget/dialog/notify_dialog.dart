import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/ui/widget/button/button.exports.dart';


class NotifyDialog extends StatelessWidget {
  final String title, content, textButton;

  const NotifyDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.size10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, title, content, textButton),
    );
  }
}

dialogContent(BuildContext context,String title,  String content, String textButton) {
  Size size = MediaQuery.of(context).size;

  return Container(
    width: size.width * 0.3,
    padding: const EdgeInsets.all(Dimens.size15),
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Dimens.size15),
          topRight: Radius.circular(Dimens.size15),
          bottomRight: Radius.circular(Dimens.size15)),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: Dimens.size10,
          offset: Offset(0.0, Dimens.size10),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, // To make the card compact
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: Dimens.size20, color: Colors.red),
        ),
        const SizedBox(
          height: Dimens.size5,
        ),
        Divider(
          thickness: Dimens.size1,
          color: ColorConst.dividerHome,
        ),
        const SizedBox(
          height: Dimens.size5,
        ),
        Text(
          content,
          style: const TextStyle(fontSize: Dimens.size17),
        ),
        const SizedBox(
          height: Dimens.size15,
        ),
        RoundedButton(
          text: textButton,
          color: ColorConst.mainColor,
          fontSize: Dimens.size17,
          height: Dimens.size45,
          press: (){
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(
          height: Dimens.size5,
        ),
      ],
    ),
  );
}
