import 'package:flutter/material.dart';
import 'package:halkculator/core/theme/app_colors.dart';
import 'package:halkculator/core/theme/app_sizes.dart';

abstract final class AppTheme {
  static final light = _build(
    const ColorScheme.light(
      primary: AppColors.brand,
      secondary: AppColors.brand,
    ),
  );

  static final dark = _build(
    const ColorScheme.dark(
      primary: AppColors.brand,
      secondary: AppColors.brand,
    ),
  );

  static ThemeData _build(ColorScheme colorScheme) {
    const inputBorder = OutlineInputBorder(
      borderRadius: AppSizes.borderRadius,
      borderSide: BorderSide(
        color: AppColors.brand,
        width: AppSizes.borderWidth,
      ),
    );

    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: const AppBarThemeData(
        centerTitle: true,
        backgroundColor: AppColors.brand,
      ),
      inputDecorationTheme: const InputDecorationThemeData(
        border: inputBorder,
        enabledBorder: inputBorder,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          side: const BorderSide(
            color: AppColors.brand,
            width: AppSizes.buttonBorderWidth,
          ),
        ),
      ),
    );
  }
}
