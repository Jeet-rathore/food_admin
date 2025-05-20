import 'package:flutter/material.dart';

import 'package:foodapp_admin/Them/colour.dart';
import 'package:foodapp_admin/Them/typography.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.primary,
    fontFamily: 'Roboto', // optional
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: AppTypography.headlineMedium,
    ),
    textTheme: const TextTheme(
      displayLarge: AppTypography.headlineLarge,
      displayMedium: AppTypography.headlineMedium,
      bodyLarge: AppTypography.bodyLarge,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.button,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: AppTypography.button,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}
