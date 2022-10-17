import 'package:flutter/material.dart';
import 'package:moffice_web/controllers/blocs/login/login.exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moffice_web/ui/pages/login/components/components.exports.dart';

class Login extends StatelessWidget {

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}