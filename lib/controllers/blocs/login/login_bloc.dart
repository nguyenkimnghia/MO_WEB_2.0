import 'dart:async';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/core/network/repositories/repositories.exports.dart';
import 'package:moffice_web/helpers/store/store.exports.dart';
import 'login_event.dart';
import 'login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final LoginRepositories loginRepositories = LoginRepositories();

  LoginBloc() : super(LoginState()) {
    on<LoginUsernameChanged>(_onLoginUsernameChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<ShowWarningEmpty>(_onShowWarningEmpty);
    on<ShowWarningWrongInfoAccount>(_onShowWarningWrongInfoAccount);
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onShowWarningEmpty(
      ShowWarningEmpty event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
      showWarningEmptyUsername: event.showWarningEmptyUsername,
      showWarningEmptyPassword: event.showWarningEmptyPassword,
    ));
  }

  Future<void> _onShowWarningWrongInfoAccount(
      ShowWarningWrongInfoAccount event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        showWarningWrongInfoAccount: event.showWrongInfoAccount));
  }

  Future<void> _onLoginUsernameChanged(
      LoginUsernameChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(username: event.username));
  }

  Future<void> _onLoginPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    if (state.loginStatus == LoginStatus.initial) {
      emit(state.copyWith(loginStatus: LoginStatus.submitting));
      try {
        ResponseCommon dataLogin = await loginRepositories.authenKeyCloak(state.username.toLowerCase().trim(), state.password);
        // Lưu thông tin
        StorageCached.localStorage.saveString(StorageCached.dataUserInfo, dataLogin.data);
        emit(state.copyWith(
            loginStatus: LoginStatus.success,
            response: dataLogin.toJson()));
      } catch (e) {
        if (e == NetworkConst.keycloakRequestUnauthorized ||
            e == NetworkConst.keycloakRequestBad) {
          emit(state.copyWith(
              loginStatus: LoginStatus.failed, statusCode: e as int));
        } else {
          emit(state.copyWith(
              loginStatus: LoginStatus.failed,
              statusCode: NetworkConst.keycloakRequestConnectionTimeout));
        }
      }
    }
  }
}
