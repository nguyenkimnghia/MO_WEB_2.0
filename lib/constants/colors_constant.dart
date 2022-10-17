import 'package:flutter/material.dart';

class ColorConst {

  static Color mainColor = HexColor("#141ED2");
  static Color textPrimaryColor = HexColor("#070707");
  static Color dividerHome = HexColor("#EDEDED");

  // input field Login
  static Color hintTextColorLogin = HexColor("#93939C");
  static Color borderInputFieldLogin = HexColor("#C3C3C6");
  static Color showPassLogin = HexColor("#CECECE");

  // Color for Sidebar
  static Color itemSidebarInactive = HexColor("#CFD0DB");
  static Color itemSidebarActive = HexColor("#333951");
  static Color bgSidebar = HexColor("#333951");

  // Color for main
  static Color bgMain = HexColor("#F3F4FB");
  static Color colorSignBlock = HexColor("#434BDB");
  static Color colorDocumentBlock = HexColor("#F29913");
  static Color colorHintTextSearch = HexColor("#40151132");
  static Color colorTextNameContact = HexColor("#2E3249");
  static Color colorTextEmailContact = HexColor("#6D7184");
  static Color colorTextPositionContact = HexColor("#838798");
  static Color colorBorderItemContact = HexColor("#1A1F3114");
  static Color colorHoverItemContact = HexColor("#F9F9FF");

  //popup contact info
  static Color colorTitlePopupContact = HexColor("#14142B");
  static Color colorClosePopupContact = HexColor("##1F1F1F");
  static Color colorTextStatusContact = HexColor("#389E0D");
  static Color colorBgStatusContact = HexColor("#237804");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}