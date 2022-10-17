import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/controllers/blocs/main/main.exports.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'package:moffice_web/ui/pages/home/main/components/components.exports.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainPageBloc>(
        create: (context) => MainPageBloc()..add(LoadDataHome()),
        child: Scaffold(
        backgroundColor: ColorConst.bgMain,
        body: SingleChildScrollView(
          primary: false,
          padding: const EdgeInsets.symmetric(vertical: Dimens.size30, horizontal: Dimens.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderBar(),
              const Gap(Dimens.size40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      DigitalSignCard(
                          color: ColorConst.colorSignBlock,
                          titleBlock: AppLocalizations.of(context).translate("title_sign"),
                          iconName: ImagesNameConst.icSign),
                      const Gap(Dimens.size16),
                      DocumentCard(
                          color: ColorConst.colorDocumentBlock,
                          titleBlock: AppLocalizations.of(context).translate("title_document"),
                          iconName: ImagesNameConst.icDocument),
                    ],
                  ),
                  const Gap(Dimens.size32),
                  const Mission()
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}