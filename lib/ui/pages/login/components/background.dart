import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/ui/widget/responsive/responsive.exports.dart';

class Background extends StatelessWidget {

  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: !ResponsiveWidget.isLargeScreen(context) ?
      const BoxDecoration(
        color: Colors.white
      ) :
      BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImagesNameConst.getImage(ImagesNameConst.loginBg)),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
