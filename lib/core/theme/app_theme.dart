import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.lightPrimary,
      scaffoldBackgroundColor: AppColors.lightBackground,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lightPrimary,
        secondary: AppColors.secondary,
        background: AppColors.lightBackground,
        surface: AppColors.lightSurface,
        onBackground: AppColors.lightOnBackground,
        onSurface: AppColors.lightOnSurface,
        error: AppColors.error,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTypography.h1.copyWith(color: AppColors.lightOnBackground),
        headlineMedium: AppTypography.h2.copyWith(color: AppColors.lightOnBackground),
        titleLarge: AppTypography.h3.copyWith(color: AppColors.lightOnBackground),
        bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.lightOnSurface),
        bodyMedium: AppTypography.bodyMedium.copyWith(color: AppColors.lightOnSurface),
        labelLarge: AppTypography.buttonText,
        bodySmall: AppTypography.caption.copyWith(color: AppColors.grey),
      ),
      cardTheme: CardThemeData(
        color: AppColors.lightSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.grey.withOpacity(0.1)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightSurface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.grey.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.lightPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.darkPrimary,
      scaffoldBackgroundColor: AppColors.darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimary,
        secondary: AppColors.secondary,
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
        onBackground: AppColors.darkOnBackground,
        onSurface: AppColors.darkOnSurface,
        error: AppColors.error,
      ),
      textTheme: TextTheme(
        headlineLarge: AppTypography.h1.copyWith(color: AppColors.darkOnBackground),
        headlineMedium: AppTypography.h2.copyWith(color: AppColors.darkOnBackground),
        titleLarge: AppTypography.h3.copyWith(color: AppColors.darkOnBackground),
        bodyLarge: AppTypography.bodyLarge.copyWith(color: AppColors.darkOnSurface),
        bodyMedium: AppTypography.bodyMedium.copyWith(color: AppColors.darkOnSurface),
        labelLarge: AppTypography.buttonText,
        bodySmall: AppTypography.caption.copyWith(color: AppColors.grey),
      ),
      cardTheme: CardThemeData(
        color: AppColors.darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.darkOnSurface.withOpacity(0.1)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkSurface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkOnSurface.withOpacity(0.2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.darkOnSurface.withOpacity(0.2)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.darkPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
    );
  }
}
