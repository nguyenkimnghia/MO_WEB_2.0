import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'package:moffice_web/ui/pages/home/sidebar/sidebar.exports.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moffice_web/ui/widget/animation/animation.exports.dart';


class SideBar extends StatefulWidget {

  final Function(int index) onTap;
  
  const SideBar({Key? key, required this.onTap}) : super(key: key);

  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  List<bool> selected = [true, false, false, false, false];
  void select(int n) {
    for (int i = 0; i < 5; i++) {
      if (i != n) {
        selected[i] = false;
      } else {
        selected[i] = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnHoverWidget(
     builder: (bool isHovered) {
      return Container(
        color: ColorConst.bgSidebar,
        width: isHovered ? Dimens.size236 : Dimens.size80,
        height: double.infinity,
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Layout title
              Padding(
                padding: const EdgeInsets.only(left: Dimens.size24, top: Dimens.size40, bottom: Dimens.size60),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      ImagesNameConst.getSVG(ImagesNameConst.logoMB),
                      width: Dimens.size32,
                      height: Dimens.size32,
                    ),
                    Visibility(
                      visible: isHovered,
                      child: const SizedBox(width: Dimens.size8)),
                    Visibility(
                      visible: isHovered,
                      child: Expanded(
                        child: Text(
                          IdentifierConst.webName,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: Dimens.size20,
                              color: Colors.white
                          ),),
                      ),
                    )
                  ],
                ),
              ),
              // Layout menu
              MenuLevelOne(
                iconName: ImagesNameConst.icHome,
                title: AppLocalizations.of(context).translate("title_home"),
                active: selected[0],
                isHovered: isHovered,
                touched: () {
                  setState(() {
                    select(0);
                  });
                  widget.onTap(0);
                },
              ),
              MenuLevelTwo(
                iconName: ImagesNameConst.icSign,
                title: AppLocalizations.of(context).translate("title_sign"),
                active: selected[1],
                isHovered: isHovered,
                touched: () {
                  setState(() {
                    select(1);
                  });
                  widget.onTap(1);
                },
              ),
              MenuLevelOne(
                iconName: ImagesNameConst.icDocument,
                title: AppLocalizations.of(context).translate("title_document"),
                active: selected[2],
                isHovered: isHovered,
                touched: () {
                  setState(() {
                    select(2);
                  });
                  widget.onTap(2);
                },
              ),
              MenuLevelOne(
                iconName: ImagesNameConst.icAdmin,
                title: AppLocalizations.of(context).translate("title_admin"),
                active: selected[3],
                isHovered: isHovered,
                touched: () {
                  setState(() {
                    select(3);
                  });
                  widget.onTap(3);
                },
              ),
              MenuLevelOne(
                iconName: ImagesNameConst.icDashboard,
                title: AppLocalizations.of(context).translate("title_dashboard"),
                active: selected[4],
                isHovered: isHovered,
                touched: () {
                  setState(() {
                    select(4);
                  });
                  widget.onTap(4);
                },
              ),
              // Layout đổi ngôn ngữ
              // Padding(
              //   padding: const EdgeInsets.all(Dimens.size24),
              //   child: Row(
              //     children: [
              //       Image.asset(
              //         ImagesNameConst.getIcon(ImagesNameConst.icVn),
              //         width: Dimens.size24,
              //         height: Dimens.size24,
              //       ),
              //       Visibility(
              //         visible: isHovered,
              //         child: const SizedBox(width: Dimens.size16)),
              //       Visibility(
              //         visible: isHovered,
              //         child: Expanded(
              //           child: Text(
              //             AppLocalizations.of(context).translate("language_vn"),
              //             style: TextStyle(
              //                 fontWeight: FontWeight.w400,
              //                 fontSize: Dimens.size14,
              //                 color: ColorConst.itemSidebarInactive
              //             ),),
              //         ),
              //       ),
              //       Visibility(
              //         visible: isHovered,
              //         child: const Icon(
              //           Icons.keyboard_arrow_down_outlined,
              //           color: Colors.white,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}