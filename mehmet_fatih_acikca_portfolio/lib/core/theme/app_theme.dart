
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Tasarım Prensibi Renkleri
  static const Color primaryGreen = Color(0xFF4A7C59); // Sakin yeşil
  static const Color backgroundOffWhite = Color(0xFFFAF8F5); // Kırık beyaz / Krem
  static const Color textDarkGrey = Color(0xFF2D3436); // Okunabilirliği yüksek koyu gri
  static const Color secondaryAmber = Color(0xFFF39C12); // Sıcak amber vurgu (Butonlar vb.)

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundOffWhite,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryGreen,
        primary: primaryGreen,
        secondary: secondaryAmber,
        background: backgroundOffWhite,
        surface: Colors.white,
        onPrimary: Colors.white,
        onSurface: textDarkGrey,
      ),
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.nunito(color: textDarkGrey, fontWeight: FontWeight.bold),
        displayMedium: GoogleFonts.nunito(color: textDarkGrey, fontWeight: FontWeight.bold),
        headlineLarge: GoogleFonts.nunito(color: textDarkGrey, fontWeight: FontWeight.w700),
        titleLarge: GoogleFonts.nunito(color: textDarkGrey, fontWeight: FontWeight.w600),
        // Gövde metinleri (body): Erişilebilirlik için 16px - 18px ve 1.6 satır yüksekliği
        bodyLarge: GoogleFonts.inter(color: textDarkGrey, fontSize: 18, height: 1.6),
        bodyMedium: GoogleFonts.inter(color: textDarkGrey, fontSize: 16, height: 1.6),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundOffWhite,
        foregroundColor: textDarkGrey,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryGreen,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}