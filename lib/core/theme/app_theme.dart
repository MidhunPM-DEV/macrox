import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/core/theme/app_typography.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryColor,
        surface: AppColors.surfaceColor,
        error: AppColors.errorColor,
        onPrimary: AppColors.textColor,
        onSurface: AppColors.textColor,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: AppTypography.textTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surfaceColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textColor),
      ),
      cardTheme: const CardThemeData(
        color: AppColors.cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerColor,
        thickness: 1,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.surfaceColor,
        indicatorColor: AppColors.primaryColor.withValues(alpha: 0.18),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: AppColors.primaryColor);
          }
          return const IconThemeData(color: AppColors.textSecondaryColor);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final color = states.contains(WidgetState.selected)
              ? AppColors.primaryColor
              : AppColors.textSecondaryColor;
          return TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: color,
          );
        }),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.errorColor),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: AppColors.surfaceColor,
        headerBackgroundColor: AppColors.primaryColor,
        headerForegroundColor: AppColors.textColor,
        dayForegroundColor: WidgetStatePropertyAll(AppColors.textColor),
        dayBackgroundColor: WidgetStatePropertyAll(AppColors.surfaceColor),
        todayForegroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
        todayBackgroundColor: WidgetStatePropertyAll(AppColors.surfaceColor),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surfaceColor,
        contentTextStyle: AppTypography.textTheme.bodyMedium,
      ),
    );
  }
}
