import 'package:equatable/equatable.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/core/network/models/output/search_employ_model.dart';

enum StatusLoading {initial, loading, success, failure}

class SearchContactState extends Equatable {
  String? text;
  List<EmployeeModel>? lstEmployeeModel;
  StatusLoading? statusLoading;
  UserInfo? userDetail;

  SearchContactState({
    this.text = "",
    this.lstEmployeeModel,
    this.statusLoading = StatusLoading.initial,
    this.userDetail
  });

  SearchContactState copyWith({
    String? text,
    List<EmployeeModel>? lstEmployeeModel,
    StatusLoading? statusLoading,
    UserInfo? userDetail
  }) {
    return SearchContactState(
      text: text ?? this.text,
      lstEmployeeModel: lstEmployeeModel ?? this.lstEmployeeModel,
      statusLoading: statusLoading ?? this.statusLoading,
      userDetail: userDetail ?? this.userDetail
    );
  }

  @override
  List<Object?> get props => [text, lstEmployeeModel, statusLoading, userDetail];
}
