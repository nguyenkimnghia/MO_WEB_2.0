import 'package:flutter/material.dart';
import 'components.exports.dart';

class Body extends StatelessWidget {

  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Background(
      child: Stack(
          children: const [
            LoginForm(),
            SelectLanguage(),
            Copyright()
          ]),
    );
  }
}

