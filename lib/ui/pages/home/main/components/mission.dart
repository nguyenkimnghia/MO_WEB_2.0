import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:moffice_web/ui/widget/animation/animation.exports.dart';

class Mission extends StatelessWidget {
  const Mission({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context).translate("mission_inprocess"),
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: Dimens.size16, color: Colors.black)),
            const Gap(Dimens.size16),
            OnHoverWidget(
              builder: (bool isHovered) {
                return Container(
                  width: Dimens.size400,
                  height: Dimens.size362,
                  padding: const EdgeInsets.all(Dimens.size24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimens.size16),
                    boxShadow: [
                      BoxShadow(
                          color: isHovered ? Colors.black26 : Colors.black12,
                          blurRadius: 20.0,
                          spreadRadius: 5.0
                      )
                    ],
                  ),
                  child: Column(
                    children:  [
                      SvgPicture.asset(
                        ImagesNameConst.getSVG(ImagesNameConst.missionChart),
                        width: Dimens.size155,
                        height: Dimens.size155,
                      ),
                      const Gap(Dimens.size40),
                      SvgPicture.asset(
                        ImagesNameConst.getSVG(ImagesNameConst.missionStatus),
                      ),
                      const Gap(Dimens.size24),
                      Image.asset(
                          ImagesNameConst.getImage(ImagesNameConst.missionExpire)
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        const Gap(Dimens.size32),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context).translate("mission_assign"),
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: Dimens.size16, color: Colors.black)),
            const Gap(Dimens.size16),
            OnHoverWidget(
              builder: (bool isHovered) {
                return Container(
                  width: Dimens.size400,
                  height: Dimens.size362,
                  padding: const EdgeInsets.all(Dimens.size24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimens.size16),
                    boxShadow: [
                      BoxShadow(
                          color: isHovered ? Colors.black26 : Colors.black12,
                          blurRadius: 20.0,
                          spreadRadius: 5.0
                      )
                    ],
                  ),
                  child: Column(
                    children:  [
                      SvgPicture.asset(
                        ImagesNameConst.getSVG(ImagesNameConst.missionChart),
                        width: Dimens.size155,
                        height: Dimens.size155,
                      ),
                      const Gap(Dimens.size40),
                      SvgPicture.asset(
                        ImagesNameConst.getSVG(ImagesNameConst.missionStatus),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}