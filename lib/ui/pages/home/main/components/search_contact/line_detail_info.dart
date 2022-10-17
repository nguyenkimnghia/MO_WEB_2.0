import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';

class LineDetailInfo extends StatelessWidget {
  final String title;
  final String content;

  LineDetailInfo({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(title,
              style: const TextStyle(
                  fontSize: Dimens.size14, fontWeight: FontWeight.w600)),
        ),
        Expanded(
          flex: 4,
          child: Text(content,
              style: const TextStyle(
                  fontSize: Dimens.size14, fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
