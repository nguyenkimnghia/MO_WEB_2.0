import 'package:equatable/equatable.dart';

enum LoginStatus {
  initial,
  submitting,
  success,
  failed
}

class LoginState extends Equatable {
  final String username;
  final bool showWarningEmptyUsername;
  bool get isValidUsername => username.isNotEmpty;


  final String password;
  final bool showWarningEmptyPassword;
  bool get isValidPassword => password.isNotEmpty;

  final bool showWarningWrongInfoAccount;

  LoginStatus loginStatus;

  final int statusCode;
  final String response;

  LoginState({
    this.username = "",
    this.showWarningEmptyUsername = false,
    this.password = "",
    this.showWarningEmptyPassword = false,
    this.loginStatus = LoginStatus.initial,
    this.statusCode = 0,
    this.response = "",
    this.showWarningWrongInfoAccount = false,
  });

  LoginState copyWith({
    String? username,
    bool? showWarningEmptyUsername,
    String? password,
    bool? showWarningEmptyPassword,
    LoginStatus? loginStatus,
    int? statusCode,
    String? response,
    bool? showWarningWrongInfoAccount,
  }) {
    return LoginState(
      username: username ?? this.username,
      showWarningEmptyUsername: showWarningEmptyUsername ?? this.showWarningEmptyUsername,
      password: password ?? this.password,
      showWarningEmptyPassword: showWarningEmptyPassword ?? this.showWarningEmptyPassword,
      loginStatus: loginStatus ?? this.loginStatus,
      statusCode: statusCode ?? this.statusCode,
      response: response ?? this.response,
      showWarningWrongInfoAccount: showWarningWrongInfoAccount ?? this.showWarningWrongInfoAccount,
    );
  }

  @override
  List<Object?> get props => [username, password, loginStatus, showWarningEmptyUsername, showWarningEmptyPassword, showWarningWrongInfoAccount];
}
