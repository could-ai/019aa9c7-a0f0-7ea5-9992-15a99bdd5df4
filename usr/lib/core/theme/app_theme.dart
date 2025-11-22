import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF0A3D62);
  
  // Accent Colors
  static const Color accentBlue = Color(0xFF00D2FF);
  static const Color accentGreen = Color(0xFF3AE374);
  static const Color accentYellow = Color(0xFFFFC312);
  static const Color accentLime = Color(0xFFC4E538);
  static const Color accentTeal = Color(0xFF12CBC4);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: accentBlue,
      colorScheme: const ColorScheme.dark(
        primary: accentBlue,
        secondary: accentGreen,
        surface: Color(0xFF104E7A), // Slightly lighter than background for cards
        background: background,
        error: Color(0xFFFF4757),
      ),
      fontFamily: 'Poppins', // Assuming Poppins as per Figma spec hint, falling back to default if not added
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Square-rounded
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.white.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
    );
  }
}
