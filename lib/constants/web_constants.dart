import 'package:flutter/material.dart';

class WebFonts {
  WebFonts._();
  static String avertaStdCY = "Averta Std CY";
}

class WebThemes {

  WebThemes._();

  static ThemeData getLightTheme() {
    return ThemeData(
      fontFamily: WebFonts.avertaStdCY,
      primarySwatch: Colors.blue,
      backgroundColor: Colors.white,
      cardColor: Colors.blueGrey[50],
      primaryTextTheme: TextTheme(
        button: TextStyle(
          color: Colors.blueGrey,
          decorationColor: Colors.blueGrey[300],
        ),
        subtitle2: TextStyle(
          color: Colors.blueGrey[900],
        ),
        subtitle1: const TextStyle(
          color: Colors.black,
        ),
        headline1: TextStyle(color: Colors.blueGrey[800]),
      ),
      bottomAppBarColor: Colors.blueGrey[900],
      iconTheme: const IconThemeData(color: Colors.blueGrey),
      brightness: Brightness.light,
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(
      fontFamily: WebFonts.avertaStdCY,
      primarySwatch: Colors.blueGrey,
      backgroundColor: Colors.blueGrey[900],
      cardColor: Colors.black,
      primaryTextTheme: TextTheme(
        button: TextStyle(
          color: Colors.blueGrey[200],
          decorationColor: Colors.blueGrey[50],
        ),
        subtitle2: const TextStyle(
          color: Colors.white,
        ),
        subtitle1: TextStyle(
          color: Colors.blueGrey[300],
        ),
        headline1: const TextStyle(
          color: Colors.white70,
        ),
      ),
      bottomAppBarColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.blueGrey[200]),
      brightness: Brightness.dark,
    );
  }
}