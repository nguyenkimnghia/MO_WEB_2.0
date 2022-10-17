import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{}

class LoginUsernameChanged extends LoginEvent {

   final String username;

  LoginUsernameChanged({required this.username});

  @override
  List<Object?> get props => [username];
}

class ShowWarningEmpty extends LoginEvent {

  final bool showWarningEmptyUsername;
  final bool showWarningEmptyPassword;

  ShowWarningEmpty({
    required this.showWarningEmptyUsername,
    required this.showWarningEmptyPassword,
  });

  @override
  List<Object?> get props => [showWarningEmptyUsername, showWarningEmptyPassword];
}

class ShowWarningWrongInfoAccount extends LoginEvent {

  final bool showWrongInfoAccount;

  ShowWarningWrongInfoAccount({
    required this.showWrongInfoAccount,
  });

  @override
  List<Object?> get props => [showWrongInfoAccount];
}

class LoginPasswordChanged extends LoginEvent {

  final String password;

  LoginPasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];

}

class LoginSubmitted extends LoginEvent{
  @override
  List<Object?> get props => [];
}