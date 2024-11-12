import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app__fonts.dart';
import 'app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ThemeData lightTheme = ThemeData(

  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: FontConstants.dINNextLTArabicFontFamily,
  brightness: Brightness.light,
  textTheme: TextTheme(
    titleLarge:  TextStyle(
      fontSize: FontSize.s32,
      color: AppColors.getTextColor(Brightness.light),
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,

    ),
    titleMedium: TextStyle(
      fontSize: FontSize.s24,
      color: AppColors.getTextColor(Brightness.light),
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    titleSmall:  TextStyle(
      fontSize: FontSize.s16,
      color: AppColors.getTextColor(Brightness.light),
      fontWeight: FontWeight.w400,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,

    ),
    labelMedium:  TextStyle(
      fontSize: FontSize.s20,
      fontWeight: FontWeightManager.bold,
      color: AppColors.light,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    displaySmall:  TextStyle(
      fontSize: FontSize.s12,
      fontWeight: FontWeight.w500,
      color: AppColors.getTextGeryColor(Brightness.light),
      fontFamily: FontConstants.dINNextLTArabicFontFamily,

    ),
    displayMedium:  TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeight.normal,
      color: AppColors.getTextColor(Brightness.light),
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),

    displayLarge:  TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeight.w700,
      color:  AppColors.getTextColor(Brightness.light),
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    bodyLarge:  TextStyle(
      fontSize: FontSize.s22,
      color: AppColors.getTextColor(Brightness.light),
      fontWeight: FontWeight.bold,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    bodyMedium: const TextStyle(
      fontSize: FontSize.s18,
      color: AppColors.red,
      fontWeight: FontWeight.bold,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,

    ),headlineSmall:  TextStyle(
      fontSize: FontSize.s14,
      color: AppColors.red,
      fontWeight: FontWeight.bold,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,

    ),
    headlineMedium: const TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.medium,
      color: AppColors.boldGrey,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,

    ),
    headlineLarge: const TextStyle(
      fontSize: FontSize.s22,
      fontWeight: FontWeightManager.bold,
      color: AppColors.red,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),

  ),

  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primary,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: AppColors.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: AppColors.boldGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: AppColors.primary),
    ),
    labelStyle: TextStyle(
      color: AppColors.boldGrey,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
      fontWeight: FontWeight.w300, // background
    ),
    hintStyle: TextStyle(
      color: AppColors.offWhite1,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
      fontWeight: FontWeight.w300, // background
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      textStyle: TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeightManager.bold,
        fontFamily: FontConstants.dINNextLTArabicFontFamily,
        // Bold
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primary,
  ).copyWith(background: AppColors.light),
);

//  Custom Input Decoration
InputDecoration customInputDecoration(
    BuildContext context,
    String labelText,
    String hintText, {
      Widget? suffixIcon,
    })
{
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    hoverColor:  AppColors.light,
    fillColor: AppColors.light,
    focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.primary),
    ),
    border: OutlineInputBorder(

      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: AppColors.primary),
      gapPadding: 10,
    ),
    labelStyle: Theme.of(context).textTheme.titleSmall,
    hintStyle: Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: AppColors.boldGrey),
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    suffixIcon: suffixIcon, // Use the optional suffixIcon parameter
  );
}

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: Color(0xFF031F2D),
  fontFamily: FontConstants.dINNextLTArabicFontFamily,
  brightness: Brightness.dark,
  textTheme: TextTheme(
    titleLarge:  TextStyle(
      fontSize: FontSize.s32,
      color: AppColors.light,
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    titleMedium:  TextStyle(
      fontSize: FontSize.s24,
      color: AppColors.getTextColor(Brightness.dark), // Darker accent
      fontWeight: FontWeightManager.bold,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    titleSmall:  TextStyle(
      fontSize: FontSize.s16,
      color: AppColors.light,
      fontWeight: FontWeight.w400,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    labelMedium:  const TextStyle(
      fontSize: FontSize.s20,
      fontWeight: FontWeightManager.bold,
      color: AppColors.boldBlack,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    displaySmall:  TextStyle(
      fontSize: FontSize.s12,
      fontWeight: FontWeight.w500,
      color: AppColors.getTextGeryColor(Brightness.dark),
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    displayMedium:  TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeight.normal,
      color: AppColors.light,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    displayLarge:  TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeight.w700,
      color:  AppColors.getTextColor(Brightness.dark),
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    bodyLarge:  TextStyle(
      fontSize: FontSize.s22,
      color: AppColors.getTextColor(Brightness.dark),
      fontWeight: FontWeight.bold,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    bodyMedium: const TextStyle(
      fontSize: FontSize.s18,
      color: AppColors.red,
      fontWeight: FontWeight.bold,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    headlineSmall:  TextStyle(
      fontSize: FontSize.s14,
      color: AppColors.red,
      fontWeight: FontWeight.bold,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.medium,
      color: AppColors.backgroundGrey,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
    headlineLarge: const TextStyle(
      fontSize: FontSize.s22,
      fontWeight: FontWeightManager.bold,
      color: AppColors.red, // Accent color stays the same
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
    ),
  ),

  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primary,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.boldBlack,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: AppColors.secColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: AppColors.backgroundGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: AppColors.secColor),
    ),
    labelStyle: TextStyle(
      color: AppColors.backgroundGrey,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
      fontWeight: FontWeight.w300, // background
    ),
    hintStyle: TextStyle(
      color: AppColors.offWhite,
      fontFamily: FontConstants.dINNextLTArabicFontFamily,
      fontWeight: FontWeight.w300, // background
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      textStyle: TextStyle(
        fontSize: FontSize.s16,
        fontWeight: FontWeightManager.bold,
        fontFamily: FontConstants.dINNextLTArabicFontFamily,
      ),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.secColor,
    brightness: Brightness.dark,
  ).copyWith(background: AppColors.getTextColor(Brightness.light)),
);
