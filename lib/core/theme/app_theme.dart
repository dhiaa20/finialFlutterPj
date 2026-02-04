import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exam_flutter/core/constants/app_constants.dart';

/// Application theme configuration
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  /// Get the main theme data
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      
      // Color scheme
      colorScheme: ColorScheme.light(
        primary: AppConstants.primaryOrange,
        secondary: AppConstants.accentAmber,
        surface: AppConstants.white,
        error: AppConstants.errorRed,
        onPrimary: AppConstants.white,
        onSecondary: AppConstants.white,
        onSurface: AppConstants.darkText,
        onError: AppConstants.white,
      ),
      
      scaffoldBackgroundColor: AppConstants.backgroundColor,
      
      // Typography
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppConstants.darkText),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppConstants.darkText),
        displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppConstants.darkText),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppConstants.darkText),
        titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppConstants.darkText),
        bodyLarge: TextStyle(fontSize: 16, color: AppConstants.darkText),
        bodyMedium: TextStyle(fontSize: 14, color: AppConstants.darkText),
        bodySmall: TextStyle(fontSize: 12, color: AppConstants.lightText),
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppConstants.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          borderSide: const BorderSide(color: AppConstants.primaryOrange, width: 1.5),
        ),
      ),
      
      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.primaryOrange,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: AppConstants.primaryOrange.withValues(alpha: 0.3),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      
      // App bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppConstants.primaryOrange,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      
      // Card theme
      cardTheme: CardThemeData(
        color: AppConstants.white,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        margin: const EdgeInsets.all(AppConstants.spacing8),
      ),
    );
  }

  /// Get the dark theme data
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      
      // Color scheme
      colorScheme: ColorScheme.dark(
        primary: AppConstants.primaryOrange,
        secondary: const Color(0xFFE5E5E5),
        surface: const Color(0xFF1E1E1E),
        error: AppConstants.errorRed,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.white,
        onError: Colors.white,
      ),
      
      scaffoldBackgroundColor: const Color(0xFF121212),
      
      // Typography
      textTheme: GoogleFonts.interTextTheme(
        const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white70),
        ),
      ),
      
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      
      // Card theme
      cardTheme: CardThemeData(
        color: const Color(0xFF1E1E1E),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        ),
      ),

      // Input theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          borderSide: const BorderSide(color: AppConstants.primaryOrange, width: 1.5),
        ),
      ),
    );
  }

  /// Gradient for buttons and backgrounds
  static LinearGradient get primaryGradient => const LinearGradient(
        colors: [
          Color.fromARGB(255, 216, 33, 13),
          Color.fromARGB(117, 255, 72, 0),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
}
