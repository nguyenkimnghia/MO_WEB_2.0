import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'package:moffice_web/ui/widget/table/table.exports.dart';

class UserTableRole extends StatelessWidget {
  UserTableRole({Key? key, required this.userRoles}) : super(key: key);

  final List<UserRole> userRoles;

  final List<DataRow> _listDataRow = [];

  @override
  Widget build(BuildContext context) {
    List<DataColumn> column = [
      DataColumn(
        label: Text(AppLocalizations.of(context).translate("stt"), style: const TextStyle( fontSize: Dimens.size14, fontWeight: FontWeight.w600),),
      ),
      DataColumn(
        label: Text(AppLocalizations.of(context).translate("organization"), style: const TextStyle( fontSize: Dimens.size14, fontWeight: FontWeight.w600),),
      ),
      DataColumn(
        label: Text(AppLocalizations.of(context).translate("role"), style: const TextStyle( fontSize: Dimens.size14, fontWeight: FontWeight.w600),),
      ),
      DataColumn(
        label: Text(AppLocalizations.of(context).translate("position"), style: const TextStyle( fontSize: Dimens.size14, fontWeight: FontWeight.w600),),
      )
    ];
    for(int i = 0; i < userRoles.length; i++) {
      _listDataRow.add(DataRow(
        cells: [
          //stt
          DataCell(Text("${i+1}", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: Dimens.size14))),
          //đơn vị
          DataCell(Text(userRoles[i].sysOrganization?.pathName ?? '', style: const TextStyle(fontWeight: FontWeight.w400, fontSize: Dimens.size14))),
          //vai trò
          DataCell(Text(userRoles[i].sysRole.name, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: Dimens.size14))),
          //chức danh
          DataCell(Text(userRoles[i].sysRole.description, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: Dimens.size14)))
      ]));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Text(AppLocalizations.of(context).translate("list_role"),
            style: const TextStyle(
                fontSize: Dimens.size16,
                fontWeight: FontWeight.w700
            ),
          )),
        const SizedBox(height: Dimens.size16),
        HeadingTable(columns: column, rows: _listDataRow)
      ],
    );
  }
}
