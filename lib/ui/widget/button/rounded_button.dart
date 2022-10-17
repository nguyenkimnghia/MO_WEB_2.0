import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final double height;
  final GestureTapCallback press;
  final Color color, textColor;
  final Color colorBoder;

   RoundedButton({
    Key? key,
    required this.fontSize,
    required this.press,
    required this.text,
    required this.color,
    required this.height,
    this.textColor = Colors.white,
    this.colorBoder =  const Color(0x00141ed2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: SizedBox(
        height: height,
        width: size.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: color,
              side: BorderSide(width: 1, color: colorBoder)
            ),
            onPressed: press,
            child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
              ),
            )),
      ),
    );
  }
}
