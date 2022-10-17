import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuLevelOne extends StatefulWidget {
  final String iconName;
  final String title;
  final Function touched;
  final bool active;
  final bool isHovered;
  const MenuLevelOne({Key? key,
    required this.iconName,
    required this.touched,
    required this.active,
    required this.title,
    required this.isHovered,
  }) : super(key: key);
  @override
  MenuLevelOneState createState() => MenuLevelOneState();
}

class MenuLevelOneState extends State<MenuLevelOne> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.size8, horizontal: Dimens.size16),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Dimens.size30),
        child: InkWell(
          onTap: () {
            widget.touched();
          },
          splashColor: Colors.white,
          hoverColor: Colors.white12,
          borderRadius: BorderRadius.circular(Dimens.size30),
          child: Container(
            height: Dimens.size50,
            decoration: BoxDecoration(
                color: widget.active ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(Dimens.size30)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: Dimens.size15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImagesNameConst.getSVG(widget.iconName),
                    color: widget.active ? ColorConst.itemSidebarActive : ColorConst.itemSidebarInactive,
                    width: Dimens.size16,
                    height: Dimens.size16,
                  ),
                  Visibility(
                      visible: widget.isHovered,
                      child: const SizedBox(width: Dimens.size15)),
                  Visibility(
                    visible: widget.isHovered,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: Dimens.size14,
                          fontWeight: widget.active ? FontWeight.w600 : FontWeight.normal,
                          color: widget.active ? ColorConst.itemSidebarActive : ColorConst.itemSidebarInactive
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
