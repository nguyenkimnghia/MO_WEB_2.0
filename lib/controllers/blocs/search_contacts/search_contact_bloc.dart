import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/core/network/repositories/repositories.exports.dart';
import 'search_contact.export.dart';

class SearchContactBloc extends Bloc<SearchContactEvent, SearchContactState> {
  final SearchRepositories searchRepositories = SearchRepositories();

  SearchContactBloc() : super(SearchContactState()) {
    on<SearchByKeyword>(_onSearchText);
    on<SelectContact>(_onSelectContact);
  }

  Future<void> _onSearchText(SearchByKeyword event, Emitter<SearchContactState> emit) async {
    try {
      var result = (await searchRepositories.onSearchEmp(keyword: event.text)).listEmp;
      emit(state.copyWith(text: event.text, lstEmployeeModel: result));
    } catch(e) {
      emit(state.copyWith(text: event.text));
    }
  }

  Future<void> _onSelectContact(SelectContact event, Emitter<SearchContactState> emit) async {
    try {
      emit(state.copyWith(statusLoading: StatusLoading.loading));
      UserInfo userInfo = await searchRepositories.getUserInfoById(event.id);
      emit(state.copyWith(userDetail: userInfo, statusLoading: StatusLoading.success));
    } catch (e) {
      emit(state.copyWith(statusLoading: StatusLoading.failure));
    }
  }
}