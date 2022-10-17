import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/controllers/blocs/login/login.exports.dart';
import 'package:moffice_web/helpers/locale/app_localization.dart';

class RoundedUsernameField extends StatefulWidget {

  final ValueChanged<String> onChanged;

  final Function enter;

  const RoundedUsernameField({
    Key? key,
    required this.onChanged,
    required this.enter,
  }) : super(key: key);

  @override
  State<RoundedUsernameField> createState() => _RoundedUsernameFieldState();
}

class _RoundedUsernameFieldState extends State<RoundedUsernameField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
              controller: _controller,
              onChanged: widget.onChanged,
              style: const TextStyle(fontSize: Dimens.size14),
              cursorColor: Colors.blue,
              cursorHeight: 20,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConst.hintTextColorLogin, width: 1.0),
                ),
                prefixIcon: const Icon(Icons.person_outline),
                hintText: AppLocalizations.of(context).translate("enter_username"),
                hintStyle: TextStyle(
                    color: ColorConst.hintTextColorLogin,
                    fontSize: Dimens.size14,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
              ),
            ),
          );
        });
  }
}
