import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/controllers/blocs/search_contacts/search_contact.export.dart';
import 'package:moffice_web/core/network/models/output/search_employ_model.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'package:moffice_web/ui/pages/home/main/components/search_contact/search_contact.exporst.dart';
import 'package:moffice_web/ui/widget/dialog/dialog.exports.dart';
import 'package:moffice_web/ui/widget/input_field/input_field.exports.dart';
import 'package:moffice_web/ui/widget/loading/loading.export.dart';

class SearchContact extends StatelessWidget {

  GlobalKey<AutoCompleteTextFieldState<EmployeeModel>> keyCompleteTextField = GlobalKey<AutoCompleteTextFieldState<EmployeeModel>>();

  TextEditingController controller = TextEditingController();

  SearchContact({Key? key}) : super(key: key);

  Timer? bounceCallSearch;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => SearchContactBloc(),
      child: BlocConsumer<SearchContactBloc, SearchContactState>(listener: (context, state) {
          keyCompleteTextField.currentState?.updateSuggestions(state.lstEmployeeModel ?? [], isUpdate: true);

          if(state.statusLoading == StatusLoading.loading) {
            MonitorLoading().showLoading("");
          } else if (state.statusLoading == StatusLoading.success) {
            CommonDialog(child: UserInfoPopup(userDetail: state.userDetail)).show(context);
            state.userDetail = null;
            state.statusLoading = StatusLoading.initial;
            MonitorLoading().dismiss();
          } else if (state.statusLoading == StatusLoading.failure) {
            const CommonDialog(child: UserInfoPopup(userDetail: null)).show(context);
            state.userDetail = null;
            state.statusLoading = StatusLoading.initial;
            MonitorLoading().dismiss();
          }
        }, builder: (context, state) {
        FocusNode focusNode = FocusNode();

        focusNode.addListener(() {
          if (!focusNode.hasFocus) {
            keyCompleteTextField.currentState
                ?.updateSuggestions([], isUpdate: true);
          } else {
            keyCompleteTextField.currentState?.updateSuggestions(
                context.read<SearchContactBloc>().state.lstEmployeeModel ?? [],
                isUpdate: true);
          }
        });

        return AutoCompleteTextField<EmployeeModel>(
            focusNode: focusNode,
            controller: controller,
            key: keyCompleteTextField,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: Dimens.size1, horizontal: Dimens.size15),
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              hintText: AppLocalizations.of(context).translate("hint_search_contact"),
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: Dimens.size14,
                  color: ColorConst.colorHintTextSearch),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(Dimens.size12),
                child: SvgPicture.asset(
                    ImagesNameConst.getSVG(ImagesNameConst.icSearch),
                    width: Dimens.size20,
                    height: Dimens.size20),
              ),
            ),
            textChanged: (value) {
              bounceCallSearch?.cancel();
              bounceCallSearch = Timer(const Duration(milliseconds: 100), () {
                context.read<SearchContactBloc>().add(SearchByKeyword(text: value));
                bounceCallSearch?.cancel();
              });
            },
            itemSubmitted: (item) {
              context.read<SearchContactBloc>().add(SelectContact(id: item.staffId));
            },
            suggestions: state.lstEmployeeModel ?? [],
            itemBuilder: (context, suggestion) => ItemSearchContact(suggestion: suggestion),
            suggestionsAmount: 15,
            itemSorter: (a, b) => 0,
            itemFilter: (suggestion, input) => true);
      }),
    );
  }
}

class ItemSearchContact extends StatefulWidget {
  const ItemSearchContact({Key? key, required this.suggestion})
      : super(key: key);

  final EmployeeModel suggestion;

  @override
  State<ItemSearchContact> createState() => _ItemSearchContactState();
}

class _ItemSearchContactState extends State<ItemSearchContact> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (value) {
        setState(() {
          isHover = false;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: isHover ? ColorConst.colorHoverItemContact : Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Dimens.size36,
                    height: Dimens.size36,
                    margin: const EdgeInsets.only(
                        left: Dimens.size16,
                        top: Dimens.size8,
                        right: Dimens.size8),
                    child: CircleAvatar(
                        radius: Dimens.size40,
                        child: SvgPicture.asset(
                            widget.suggestion.sex == UserConstant.male
                                ? ImagesNameConst.getSVG(
                                    ImagesNameConst.icUserMale)
                                : ImagesNameConst.getSVG(
                                    ImagesNameConst.icUserFemale),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: Dimens.size8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text: widget.suggestion.fullName,
                                  style: TextStyle(
                                      color: ColorConst.colorTextNameContact,
                                      fontSize: Dimens.size14,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                    text: " (${widget.suggestion.email})",
                                    style: TextStyle(
                                        color: ColorConst.colorTextEmailContact,
                                        fontSize: Dimens.size14)),
                              ]),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: Dimens.size4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                    ImagesNameConst.getSVG(
                                        ImagesNameConst.icPosition),
                                    fit: BoxFit.fill,
                                    width: Dimens.size12,
                                    height: Dimens.size12),
                                const SizedBox(width: Dimens.size8),
                                Expanded(
                                  child: Text(widget.suggestion.position,
                                      style: TextStyle(
                                          color: ColorConst
                                              .colorTextPositionContact,
                                          fontWeight: FontWeight.w400,
                                          fontSize: Dimens.size12)),
                                ),
                              ],
                            ),
                            const SizedBox(height: Dimens.size4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                    ImagesNameConst.getSVG(
                                        ImagesNameConst.icGroup),
                                    fit: BoxFit.fill,
                                    width: Dimens.size12,
                                    height: Dimens.size12),
                                const SizedBox(width: Dimens.size8),
                                Expanded(
                                  child: Text(widget.suggestion.groupName,
                                      style: TextStyle(
                                          color: ColorConst
                                              .colorTextPositionContact,
                                          fontWeight: FontWeight.w400,
                                          fontSize: Dimens.size12)),
                                ),
                              ],
                            )
                          ]),
                    ),
                  )
                ]),
          ),
          Divider(
              height: Dimens.size1, color: ColorConst.colorBorderItemContact),
        ],
      ),
    );
  }
}
