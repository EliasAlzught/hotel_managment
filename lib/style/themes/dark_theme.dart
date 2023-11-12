import 'package:flutter/material.dart';
import 'package:hotel_managment/style/app_text_style.dart';

import '../app_colors.dart';


final ThemeData darkTheme = ThemeData(
  colorScheme: const   ColorScheme.dark(
    primary: AppColors.orange,
    onPrimary: AppColors.black,
    primaryContainer: AppColors.white,
    secondary: AppColors.orange,
    onSecondary: AppColors.grayAccent,
    secondaryContainer: AppColors.gray,
  ),
  fontFamily: "Poppins",
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
    titleTextStyle: AppTextStyle.xLargeWhite,
    toolbarTextStyle: AppTextStyle.xLargeWhite,
    color: Colors.grey[850],
    iconTheme: const IconThemeData(
      color: AppColors.orange,
    ),
    elevation: 0,
  ),
  iconTheme: const IconThemeData(color: AppColors.black, size: 25),
  primaryTextTheme: TextTheme(
    displayLarge: AppTextStyle.xxxLargeWhite,
    displayMedium: AppTextStyle.xxLargeWhite,
    displaySmall: AppTextStyle.xLargeWhite,
    bodyLarge: AppTextStyle.largeWhite,
    bodyMedium: AppTextStyle.mediumWhite,
    bodySmall: AppTextStyle.smallWhite,
    labelLarge: AppTextStyle.largeGray,
    labelMedium: AppTextStyle.mediumGray,
    labelSmall: AppTextStyle.smallGray,
    titleLarge: AppTextStyle.xLargeOrange,
    titleMedium: AppTextStyle.mediumOrange,
    titleSmall: AppTextStyle.smallOrange,
   headlineLarge: AppTextStyle.numberWhite
  ),

  textTheme: TextTheme(
    bodyLarge: AppTextStyle.mediumWhite,
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
