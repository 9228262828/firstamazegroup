import 'package:flutter/material.dart';

class AppColors {
  static const  Color primary = Color(0xff223cff);
  static const Color secColor = Color(0xff6d7ce0);
  static  Color light = Color(0xFFFfffff);
  static const Color backgroundRed = Color(0xFFFFE4F2);
  static const Color backgroundGrey = Color(0xF000000);
  static const Color red = Color.fromRGBO(255, 2, 61, 1.0);
  static const Color boldGrey = Color(0xFFDDDDE8);
  static const Color boldBlack = Color(0xFF181818);
  static const Color boldBlackMOre = Color(0xFF393a42);
  static const Color boldGreyBack = Color(0xFFDDDDE8);
  static const Color backgroundLight = Color(0xFFBABABA);
  static const Color orangeBold = Color(0xFFFF7D53);
  static const Color offWhite = Color(0xFFF2F3F8);
  static const Color offWhite1 = Color(0xFF2F2F2F99);
  static const Color offBlue = Color(0xFF0087FF);
  static const Color dark = Color(0xFF000000);
  static const Color lightGreen = Color(0xFF00F57B);
  static const Color shadow = Color(0xFFB4DBC7);


  static Color backgroundColor(ThemeMode mode) {
    return mode == ThemeMode.dark ?
    Color(0xFF063045) :
    Colors.white;

  }
  static Color backgroundColorINLight(ThemeMode mode) {
    return mode == ThemeMode.dark ? Colors.white : Color(0xFF031F2D);

  }
  static Color? backgroundColorGrey(ThemeMode mode) {
    return mode == ThemeMode.dark ? Color(0xFF063045) : Colors.white;

  }

  static Color getTextColor(Brightness brightness) {
    return brightness == Brightness.dark ? light : dark;
  }
  static Color getTextGeryColor(Brightness brightness) {
    return brightness == Brightness.dark ? boldGrey : boldBlackMOre;
  }

}