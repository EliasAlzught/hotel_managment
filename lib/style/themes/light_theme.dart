import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_text_style.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: AppColors.blue,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.black,
    secondary: AppColors.orange,
    onSecondary: AppColors.gray,
    secondaryContainer: AppColors.grayAccent,
  ),
  fontFamily: "Robot",
  primaryColor: AppColors.orange,
  indicatorColor: AppColors.orange,
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(AppColors.white),
    trackColor: MaterialStateProperty.all(AppColors.orange),
  ),
  listTileTheme: const ListTileThemeData(
    style: ListTileStyle.drawer,
    contentPadding: EdgeInsets.symmetric(horizontal: 30),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(AppColors.orange),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: AppTextStyle.xLargeBlack,
    toolbarTextStyle: AppTextStyle.xLargeBlack,
    color: Colors.grey[50],
    iconTheme: const IconThemeData(
      color: AppColors.orange,
    ),
    elevation: 0,
  ),
  iconTheme: const IconThemeData(color: AppColors.black, size: 25),
  primaryTextTheme: TextTheme(
    displayLarge: AppTextStyle.xxxLargeBlack,
    displayMedium: AppTextStyle.xxLargeBlack,
    displaySmall: AppTextStyle.xLargeBlack,
    bodyLarge: AppTextStyle.largeBlack,
    bodyMedium: AppTextStyle.mediumBlack,
    bodySmall: AppTextStyle.smallBlack,
    labelLarge: AppTextStyle.largeGray,
    labelMedium: AppTextStyle.mediumGray,
    labelSmall: AppTextStyle.smallGray,
    titleLarge: AppTextStyle.xLargeOrange,
    titleMedium: AppTextStyle.mediumOrange,
    titleSmall: AppTextStyle.smallOrange,
    headlineLarge: AppTextStyle.numberBlack
  ),
  textTheme: TextTheme(
    bodyLarge: AppTextStyle.mediumBlack,
    titleMedium: AppTextStyle.mediumBlack,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.grayAccent,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grayAccent),
      borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grayAccent),
      borderRadius: BorderRadius.circular(15),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.grayAccent),
      borderRadius: BorderRadius.circular(15),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.red),
      borderRadius: BorderRadius.circular(15),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: AppTextStyle.mediumGray,
    errorStyle: AppTextStyle.mediumRed,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: AppTextStyle.largeWhite.copyWith(fontWeight: FontWeight.w500),
      primary: AppColors.orange,
      onPrimary: AppColors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: AppTextStyle.mediumOrange.copyWith(fontWeight: FontWeight.w400),
      primary: AppColors.yellowAccent,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
    ),
  ),
);
