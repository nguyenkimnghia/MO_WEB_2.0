import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/helpers/date_time/date_time_helper.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'package:moffice_web/ui/pages/home/main/components/search_contact/search_contact.exporst.dart';

class UserInfoPopup extends StatelessWidget {
  const UserInfoPopup({Key? key, required this.userDetail}) : super(key: key);
  final UserInfo? userDetail;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimens.size16)),
      padding: const EdgeInsets.symmetric(horizontal: Dimens.size40, vertical: Dimens.size24),
      child: SingleChildScrollView(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context).translate("contact_info"),
                  style: TextStyle(
                        color: ColorConst.colorTitlePopupContact,
                        fontWeight: FontWeight.w700,
                        fontSize: Dimens.size16)),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close, size: Dimens.size24, color: ColorConst.colorClosePopupContact),
                )
              ]
            ),
            const SizedBox(height: Dimens.size24),
            userDetail != null ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //avatar
                    CircleAvatar(
                      radius: Dimens.size48,
                      child: SvgPicture.asset(ImagesNameConst.getSVG(userDetail?.gender == UserConstant.male ? ImagesNameConst.icUserMale : ImagesNameConst.icUserFemale), width: Dimens.size96, height: Dimens.size96, fit: BoxFit.fill),
                    ),
                    const SizedBox(width: Dimens.size16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Name contact
                          Row(
                            children: [
                              Text(
                                "${userDetail?.fullName} (${userDetail?.username})".toUpperCase(),
                                style: TextStyle(
                                    fontSize: Dimens.size16,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConst.mainColor),
                              ),
                              const SizedBox(width: Dimens.size10),
                              //trạng thái hoạt động
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: Dimens.size8, vertical: Dimens.size4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimens.size4),
                                  color: ColorConst.colorBgStatusContact.withOpacity(0.1),
                                ),
                                child: Text(AppLocalizations.of(context).translate("active_status"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: Dimens.size14,
                                        color: ColorConst.colorTextStatusContact)),
                              )
                            ],
                          ),
                          const SizedBox(height: Dimens.size18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //mã nhân viên
                                    LineDetailInfo(
                                      title: AppLocalizations.of(context).translate("employee_code"),
                                      content: (userDetail?.employeeCode ?? 0).toString(),
                                    ),
                                    const SizedBox(height: Dimens.size8),
                                    LineDetailInfo(
                                      title: AppLocalizations.of(context).translate("birth_year"),
                                      content: userDetail!.dateOfBirth != null && userDetail!.dateOfBirth!.isNotEmpty? DateTimeHelper.formatDate(DateTimeHelper.dd_mm_yy, DateTime.parse(userDetail!.dateOfBirth!)) : "",
                                    ),
                                    const SizedBox(height: Dimens.size8),
                                    //điện thoại
                                    LineDetailInfo(
                                      title: AppLocalizations.of(context).translate("phone"),
                                      content: userDetail?.mobilePhone ?? '',
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    //email
                                    LineDetailInfo(
                                      title: AppLocalizations.of(context).translate("email"),
                                      content: userDetail?.email ?? '',
                                    ),
                                    const SizedBox(height: Dimens.size8),
                                    //đơn vị
                                    LineDetailInfo(
                                      title: AppLocalizations.of(context).translate("organization"),
                                      content: userDetail?.organizationPathName ?? '',
                                    ),
                                    const SizedBox(height: Dimens.size8),
                                    //chức danh
                                    LineDetailInfo(
                                      title: AppLocalizations.of(context).translate("position"),
                                      content: userDetail?.positionName ?? '',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimens.size18),
                //danh sách vai trò
                UserTableRole(userRoles: userDetail?.userRoles ?? []),
              ],
            ) : Center(
              child: Text(
                  AppLocalizations.of(context).translate("not_found_info"),
                  style: const TextStyle(
                      fontSize: Dimens.size14, fontWeight: FontWeight.w400)),
            )
          ])),
    );
  }
}
