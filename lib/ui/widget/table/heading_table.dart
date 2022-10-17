import 'package:flutter/material.dart';
import 'package:moffice_web/constants/constants.exports.dart';

class HeadingTable extends StatelessWidget {
   const HeadingTable({Key? key, required this.columns, required this.rows}) : super(key: key);

  final List<DataColumn> columns;
  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: DataTable(
            decoration: BoxDecoration(
              border: Border.all(color: ColorConst.bgMain),
              borderRadius: BorderRadius.circular(Dimens.size16),
            ),
            headingRowColor: MaterialStateProperty.all<Color>(ColorConst.bgMain),
            columns: columns,
            rows: rows
        )
    );
  }
}