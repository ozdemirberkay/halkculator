import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:halkculator/config/theme/app_colors.dart';
import 'package:halkculator/config/theme/theme_utils.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: AppConstants.useMaterial3,
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.light(
        secondary: AppColors.primaryColor,
        primary: AppColors.primaryColor,
      ),
      appBarTheme: ThemeUtils.appBarTheme,
      inputDecorationTheme: ThemeUtils.inputTheme,
      elevatedButtonTheme: ThemeUtils.elevatedButtonTheme,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: AppConstants.useMaterial3,
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.dark(
        secondary: AppColors.primaryColor,
        primary: AppColors.primaryColor,
      ),
      appBarTheme: ThemeUtils.appBarTheme,
      inputDecorationTheme: ThemeUtils.inputTheme,
      elevatedButtonTheme: ThemeUtils.elevatedButtonTheme,
    );
  }
}
