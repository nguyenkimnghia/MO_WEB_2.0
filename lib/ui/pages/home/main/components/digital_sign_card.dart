import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:moffice_web/controllers/blocs/main/main.exports.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'components.exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DigitalSignCard extends StatefulWidget {

  final Color color;
  final String titleBlock;
  final String iconName;

  const DigitalSignCard({Key? key,
    required this.color,
    required this.titleBlock,
    required this.iconName}) : super(key: key);

  @override
  State<DigitalSignCard> createState() => _DigitalSignCardState();
}

class _DigitalSignCardState extends State<DigitalSignCard> {

  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, mainState){
        return MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered = false;
            });
          },
          child: AnimatedContainer(
            width: Dimens.size445,
            duration: const Duration(milliseconds: 275),
            padding: const EdgeInsets.all(Dimens.size20),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(Dimens.size15),
              boxShadow: [
                BoxShadow(
                    color: hovered ? Colors.black26 : Colors.black12,
                    blurRadius: 20.0,
                    spreadRadius: 5.0
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row (
                  children: [
                    Container(
                      height: Dimens.size40,
                      width: Dimens.size40,
                      padding: const EdgeInsets.all(Dimens.size11),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimens.size12),
                          color: Colors.white
                      ),
                      child:  SvgPicture.asset(
                        ImagesNameConst.getSVG(widget.iconName),
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: Dimens.size13),
                    Text(
                        widget.titleBlock,
                        style: const TextStyle(
                            fontSize: Dimens.size16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        )
                    )
                  ],
                ),
                const Gap(Dimens.size20),
                Row(
                  children: [
                    Expanded(
                        child: LineInfo(
                          title: !mainState.busy ? mainState.countDigitalSign.submitSign.title :
                          AppLocalizations.of(context).translate("submit_sign"),
                          count: mainState.countDigitalSign.submitSign.count.toString())
                    ),
                    const Gap(Dimens.size40),
                    Expanded(
                        child: LineInfo(
                          title: !mainState.busy ? mainState.countDigitalSign.flashSign.title :
                          AppLocalizations.of(context).translate("flash_sign"),
                          count: mainState.countDigitalSign.flashSign.count.toString())
                    ),
                  ],
                ),
                const Gap(Dimens.size20),
                Row(
                  children: [
                    Expanded(
                        child: LineInfo(
                          title: !mainState.busy ? mainState.countDigitalSign.approvalSign.title :
                          AppLocalizations.of(context).translate("approval_sign"),
                          count: mainState.countDigitalSign.approvalSign.count.toString())
                    ),
                    const Gap(Dimens.size40),
                    Expanded(
                        child: LineInfo(
                          title: !mainState.busy ? mainState.countDigitalSign.promulgate.title :
                          AppLocalizations.of(context).translate("promulgate"),
                          count: mainState.countDigitalSign.promulgate.count.toString())
                    ),
                  ],
                ),
                const Gap(Dimens.size20),
                Row(
                  children: [
                    Expanded(
                        child: LineInfo(
                          title: !mainState.busy ? mainState.countDigitalSign.sign.title :
                          AppLocalizations.of(context).translate("sign"),
                          count: mainState.countDigitalSign.sign.count.toString())
                    ),
                    const Gap(Dimens.size40),
                    Expanded(
                        child: Container()
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}