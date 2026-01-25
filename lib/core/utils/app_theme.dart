import 'package:alquran/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
  );

  // static ThemeData darkTheme = ThemeData(
  //   fontFamily: 'Cairo',
  //   brightness: Brightness.dark,
  //   scaffoldBackgroundColor: AppDarkColors.backgroundColor,
  //   primaryColor: AppDarkColors.primaryColor,
  //   cardColor: AppDarkColors.cardColor,
  //   dividerColor: AppDarkColors.dividerColor,
  //   colorScheme: ColorScheme.dark(
  //     primary: AppDarkColors.primaryColor,
  //     secondary: AppDarkColors.secondaryColor,
  //   ),
  // );
}
