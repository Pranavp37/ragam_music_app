import 'package:flutter/material.dart';
import 'package:ragam/core/configs/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    fontFamily: 'Satoshi',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    ),
  );
}
