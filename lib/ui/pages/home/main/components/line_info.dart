import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/ui/widget/animation/animation.exports.dart';

class LineInfo extends StatelessWidget {
  String title;
  String count;
  LineInfo({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return OnHoverWidget(builder: (bool isHovered) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: Dimens.size14,
                fontWeight: FontWeight.w400,
                color:  isHovered
                    ? Colors.grey[200]
                    : Colors.white,
                decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
              )),
          Text("($count)",
              style: const TextStyle(
                fontSize: Dimens.size14,
                fontWeight: FontWeight.w400,
                color: Colors.white
          ))
        ],
      );
    });
  }
}
