import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  static const TextStyle displayLarge = TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 74,
    height: .95,
    fontWeight: FontWeight.w700,
    letterSpacing: -2,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 50,
    height: 1.1,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 38,
    height: 1.15,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: 'CormorantGaramond',
    fontSize: 28,
    height: 1.3,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18,
    height: 1.9,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    height: 1.8,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14,
    height: 1.7,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: 'Inter',
    fontSize: 13,
    fontWeight: FontWeight.w700,
    letterSpacing: 3,
  );
}
