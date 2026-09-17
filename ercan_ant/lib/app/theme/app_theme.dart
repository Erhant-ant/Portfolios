import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';
import 'components/button_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    fontFamily: 'Inter',

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,

      primary: AppColors.primary,
      onPrimary: Colors.white,

      secondary: AppColors.secondary,
      onSecondary: Colors.white,

      error: Colors.red,
      onError: Colors.white,

      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,

      primaryContainer: AppColors.backgroundSecondary,
      onPrimaryContainer: AppColors.textPrimary,

      secondaryContainer: AppColors.surfaceVariant,
      onSecondaryContainer: AppColors.textPrimary,

      tertiary: AppColors.secondary,
      onTertiary: Colors.white,

      tertiaryContainer: AppColors.surfaceVariant,
      onTertiaryContainer: AppColors.textPrimary,

      surfaceContainerHighest: AppColors.surfaceVariant,

      outline: AppColors.border,

      inverseSurface: AppColors.textPrimary,
      onInverseSurface: AppColors.surface,

      inversePrimary: AppColors.secondary,

      surfaceTint: AppColors.primary,
    ),

    dividerColor: AppColors.border,

    textTheme:
        const TextTheme(
          displayLarge: AppTypography.displayLarge,
          headlineLarge: AppTypography.headlineLarge,
          headlineMedium: AppTypography.headlineMedium,
          titleLarge: AppTypography.titleLarge,
          bodyLarge: AppTypography.bodyLarge,
          bodyMedium: AppTypography.bodyMedium,
          bodySmall: AppTypography.bodySmall,
          labelLarge: AppTypography.labelLarge,
        ).apply(
          bodyColor: AppColors.textPrimary,
          displayColor: AppColors.textPrimary,
        ),

    cardColor: AppColors.surface,

    filledButtonTheme: AppButtonTheme.filledButtonTheme,

    outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
  );
}
