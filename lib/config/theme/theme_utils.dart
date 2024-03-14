import 'package:flutter/material.dart';
import 'package:halkculator/config/constants/app_constants.dart';
import 'package:halkculator/config/theme/app_colors.dart';

class ThemeUtils {
  static AppBarTheme get appBarTheme {
    return AppBarTheme(
        centerTitle: true, backgroundColor: AppColors.primaryColor);
  }

  static InputDecorationTheme get inputTheme {
    return InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: AppConstants.boxBorderWidth, color: AppColors.primaryColor),
        borderRadius: BorderRadius.all(AppConstants.radius),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
            width: AppConstants.boxBorderWidth, color: AppColors.primaryColor),
        borderRadius: BorderRadius.all(AppConstants.radius),
      ),
    );
  }

  static ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          width: AppConstants.buttonBorderWidth,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
