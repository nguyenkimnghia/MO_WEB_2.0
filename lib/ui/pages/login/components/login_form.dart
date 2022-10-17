import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/controllers/blocs/login/login.exports.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/ui/widget/dialog/dialog.exports.dart';
import 'package:moffice_web/ui/widget/input_field/input_field.exports.dart';
import 'package:moffice_web/ui/widget/loading/loading.export.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';
import 'package:moffice_web/ui/widget/responsive/responsive.exports.dart';
import 'package:moffice_web/ui/widget/toast_common/toast_utils.exports.dart';
import 'package:moffice_web/ui/widget/button/button.exports.dart';

class LoginForm extends StatelessWidget {

  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginBloc, LoginState>(builder: (context, loginState) {
      return Align(
        alignment: !ResponsiveWidget.isLargeScreen(context) ? Alignment.center : Alignment.centerRight,
        child: Container(
          width: Dimens.size460,
          padding: const EdgeInsets.symmetric(horizontal: Dimens.size32),
          margin: !ResponsiveWidget.isLargeScreen(context) ?
              const EdgeInsets.only(right: 0.0) :
              EdgeInsets.only(right: size.width * 0.125),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: Dimens.size15),
                Text(
                    AppLocalizations.of(context).translate("btn_login"),
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: Dimens.size36)),
                const SizedBox(height: Dimens.size15),
                Text(
                AppLocalizations.of(context).translate("title_intro_login1"),
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: Dimens.size18)),
                const SizedBox(height: Dimens.size30),
                // 2. Input username
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate("username"),
                      style: const TextStyle(color: Colors.black, fontSize: Dimens.size14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: Dimens.size12,
                    ),
                    RoundedUsernameField(
                      onChanged: (username) {
                        // event change username
                        context.read<LoginBloc>().add(LoginUsernameChanged(username: username));
                        // event hiden WarningWrongInfoAccount
                        context.read<LoginBloc>().add(ShowWarningWrongInfoAccount(showWrongInfoAccount: false));
                      },
                      enter: (){
                        _handleLogin(loginState, context);
                      },
                    ),
                  ],
                ),
                // 2.1. Show warning wrong username
                Visibility(
                  visible: loginState.isValidUsername ? false : loginState.showWarningEmptyUsername,
                  child: Text(
                    AppLocalizations.of(context).translate("toast_valid_login_username"),
                    style: const TextStyle(color: Colors.red, fontSize: Dimens.size14),
                  ),
                ),
                const SizedBox(height: Dimens.size20),
                // 3. Input password
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate("password"),
                      style: const TextStyle(color: Colors.black, fontSize: Dimens.size14, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: Dimens.size12,
                    ),
                    RoudedPasswordField(
                      onChanged: (String password) {
                        // event change password
                        context.read<LoginBloc>().add(LoginPasswordChanged(password: password));
                        // event hiden WarningWrongInfoAccount
                        context.read<LoginBloc>().add(ShowWarningWrongInfoAccount(showWrongInfoAccount: false));
                      },
                      enter: (){
                        _handleLogin(loginState, context);
                      },
                    ),
                  ],
                ),
                // 3.1. Show warning wrong password
                Visibility(
                  visible: loginState.isValidPassword ? false : loginState.showWarningEmptyPassword,
                  child: Text(
                    AppLocalizations.of(context).translate("toast_valid_login_password"),
                    style: const TextStyle(color: Colors.red, fontSize: Dimens.size14),
                  ),
                ),
                Visibility(
                  visible: loginState.showWarningWrongInfoAccount,
                  child: Text(
                    AppLocalizations.of(context).translate("error_unauthorized"),
                    style: const TextStyle(color: Colors.red, fontSize: Dimens.size14),
                  ),
                ),
                const SizedBox(height: Dimens.size20),
                RoundedButton(
                  press: () => _handleLogin(loginState, context),
                  text: AppLocalizations.of(context).translate("btn_login"),
                  color: ColorConst.mainColor,
                  fontSize: Dimens.size14,
                  height: Dimens.size55,
                ),
              ],
            ),
          ),
        ),
      );
    }, listener: (context, loginState) {
      final loginStatus = loginState.loginStatus;
      if (loginStatus == LoginStatus.submitting) {
        MonitorLoading().showLoading("");
      } else if (loginStatus == LoginStatus.failed) {
        MonitorLoading().dismiss();
        if (loginState.statusCode == 401 ||
            loginState.statusCode == 403) {
          context.read<LoginBloc>().add(ShowWarningWrongInfoAccount(showWrongInfoAccount: true));
        } else if (loginState.statusCode == 60) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return NotifyDialog(
                  title: AppLocalizations.of(context).translate("notify_lable"),
                  content: AppLocalizations.of(context).translate("error_connect_keycloak"),
                  textButton: AppLocalizations.of(context).translate("accept"),
                );
              });
        }
        loginState.loginStatus = LoginStatus.initial;
      } else if (loginStatus == LoginStatus.success) {
        MonitorLoading().dismiss();
        ResponseCommon result = ResponseCommon.fromJson(loginState.response);
        if (result.errorCode == NetworkConst.e000Success) {
          // 1. Thực hiện show thông báo đăng nhập thành công
          ToastUtils.showToastSuccess(result.message);
          // 2. Thực hiện chuyển sang page home
          WebRouter.goToPage(context, WebRouter.home);
        } else {
          ToastUtils.showToastError("${result.message} (${result.errorCode})");
          loginState.loginStatus = LoginStatus.initial;
        }
      }
    });
  }

  _handleLogin(LoginState loginState, BuildContext context) async {
    if (loginState.username == "" && loginState.password == "") {
      context.read<LoginBloc>().add(ShowWarningEmpty(showWarningEmptyUsername: true, showWarningEmptyPassword: true));
    } else if (loginState.username == "") {
      context.read<LoginBloc>().add(ShowWarningEmpty(showWarningEmptyUsername: true, showWarningEmptyPassword: false));
    } else if (loginState.password == "") {
      context.read<LoginBloc>().add(ShowWarningEmpty(showWarningEmptyUsername: false, showWarningEmptyPassword: true));
    } else {
      context.read<LoginBloc>().add(LoginSubmitted());
      }
    }
  }
