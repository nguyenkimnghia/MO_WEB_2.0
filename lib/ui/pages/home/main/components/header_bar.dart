import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'package:moffice_web/helpers/store/store.exports.dart';
import 'package:moffice_web/ui/pages/home/main/components/components.exports.dart';
import 'package:gap/gap.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    UserInfo userInfo = userInfoFromJson(StorageCached.localStorage.getString(StorageCached.dataUserInfo));

    return Row(
      children: [
        RichText(
          text: TextSpan(
              children: [
                TextSpan(
                    text: AppLocalizations.of(context).translate("welcome_1"),
                    style: const TextStyle(fontSize: Dimens.size18, color: Colors.black, fontWeight: FontWeight.w600)
                ),
                TextSpan(
                    text: userInfo.fullName,
                    style: TextStyle(fontSize: Dimens.size18, color: ColorConst.mainColor, fontWeight: FontWeight.w600)
                ),
                TextSpan(
                    text: AppLocalizations.of(context).translate("welcome_2"),
                    style: const TextStyle(fontSize: Dimens.size18, color: Colors.black, fontWeight: FontWeight.w600)
                ),
              ]
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(Dimens.size32),
        SizedBox(
            width: Dimens.size795,
            child: SearchContact()
        ),
      ],
    );
  }
}