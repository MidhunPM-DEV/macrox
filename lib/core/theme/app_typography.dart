import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:macrox_app/core/theme/app_colors.dart';

class AppTypography {
  AppTypography._();

  static final _base = GoogleFonts.interTextTheme();

  static final textTheme = _base.copyWith(
    displayLarge: _base.displayLarge?.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    ),

    displayMedium: _base.displayMedium?.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    ),

    displaySmall: _base.displaySmall?.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: AppColors.textColor,
    ),

    headlineLarge: _base.headlineLarge?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),

    headlineMedium: _base.headlineMedium?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),

    headlineSmall: _base.headlineSmall?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),

    titleLarge: _base.titleLarge?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),

    titleMedium: _base.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
    ),

    bodyLarge: _base.bodyLarge?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),

    bodyMedium: _base.bodyMedium?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),

    bodySmall: _base.bodySmall?.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.textColor,
    ),

    labelLarge: _base.labelLarge?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
    ),

    labelMedium: _base.labelMedium?.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
    ),

    labelSmall: _base.labelSmall?.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
    ),
  );
}
