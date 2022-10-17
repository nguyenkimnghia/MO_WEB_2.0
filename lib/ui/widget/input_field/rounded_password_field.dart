import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/controllers/blocs/login/login.exports.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';


class RoudedPasswordField extends StatefulWidget {

  final ValueChanged<String> onChanged;

  final Function enter;

  const RoudedPasswordField({
    Key? key,
    required this.onChanged,
    required this.enter,
  }) : super(key: key);

  @override
  State<RoudedPasswordField> createState() => _RoudedPasswordFieldState();
}

class _RoudedPasswordFieldState extends State<RoudedPasswordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (context, loginState){
          return SizedBox(
            height: Dimens.size65,
            child: TextField(
              onSubmitted: (value){
                widget.enter();
              },
              obscureText: _isObscure,
              onChanged: widget.onChanged,
              style: const TextStyle(fontSize: Dimens.size14),
              cursorColor: Colors.blue,
              cursorHeight: 20,
              decoration: InputDecoration(
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorConst.hintTextColorLogin, width: 1.0),
                  ),
                  hintText: AppLocalizations.of(context).translate("enter_password"),
                  hintStyle: TextStyle(color: ColorConst.hintTextColorLogin, fontSize: Dimens.size14),
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.lock_open),
                  suffixIcon: IconButton(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: Dimens.size10),
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: loginState.password.isNotEmpty ? ColorConst.showPassLogin : Colors.transparent),
                    onPressed: (){
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  border: InputBorder.none
              ),
            ),
          );
        });
  }
}
