import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:moffice_web/controllers/blocs/main/main.exports.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'package:moffice_web/ui/pages/home/main/components/components.exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DocumentCard extends StatefulWidget {

  final Color color;
  final String titleBlock;
  final String iconName;

  const DocumentCard({Key? key,
    required this.color,
    required this.titleBlock,
    required this.iconName}) : super(key: key);

  @override
  State<DocumentCard> createState() => _DocumentCardState();
}

class _DocumentCardState extends State<DocumentCard> {

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
                boxShadow:  [
                  BoxShadow(
                      color: hovered ? Colors.black38 : Colors.black12,
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
                  LineInfo(
                    title: AppLocalizations.of(context).translate("document_unread"),
                    count: mainState.documentCountModel.unreadDocument.toString()),
                  const Gap(Dimens.size20),
                  LineInfo(
                    title: AppLocalizations.of(context).translate("document_received"),
                    count: mainState.documentCountModel.receivedDocument.toString()),
                  const Gap(Dimens.size20),
                  LineInfo(
                    title: AppLocalizations.of(context).translate("document_forward"),
                    count: mainState.documentCountModel.transferDocument.toString()),
                ],
              ),
            ),
          );
        });
  }
}