import 'package:flutter/material.dart';

//0xFF393285
// const mainColor = Color(0xFF009746);
const mainColor = Color(0xFF393285);
const textColorLight = Color(0xFFC4C4C4);
const textColorBar = Color(0xFF666666);
const textColorDark = Color(0xFF000000);

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
