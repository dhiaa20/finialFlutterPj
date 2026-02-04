import 'package:flutter/material.dart';

/// Application-wide constants
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // ==================== COLORS ====================
  
  /// Primary color (Classic Red-Orange)
  static const Color primaryOrange = Color(0xFFFF5A5F);
  
  /// Accent Color (Vibrant Gold)
  static const Color accentAmber = Color(0xFFFFB400);
  
  /// Standard Dark Text
  static const Color darkText = Color(0xFF2D2D2D);
  
  /// Standard Light Text
  static const Color lightText = Color(0xFF757575);
  
  /// Standard Background (Pure White)
  static const Color backgroundColor = Color(0xFFFFFFFF);
  
  /// Success green (Emerald)
  static const Color successGreen = Color(0xFF27AE60);
  
  /// Error red (Soft Rose)
  static const Color errorRed = Color(0xFFE74C3C);
  
  /// Surface White
  static const Color white = Color(0xFFFFFFFF);

  // ==================== SPACING ====================
  
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing40 = 40.0;
  static const double spacing48 = 48.0;

  // ==================== BORDER RADIUS ====================
  
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 32.0;
  static const double radiusCircular = 100.0;

  // ==================== SHARED PREFERENCES KEYS ====================
  
  static const String keyUsers = 'users';
  static const String keyCurrentUser = 'current_user';
  static const String keyRememberMe = 'remember_me';

  // ==================== VALIDATION ====================
  
  static const int passwordMinLength = 6;
  static const int nameMinLength = 2;
  static const int phoneMinLength = 10;

  // ==================== APP INFO ====================
  
  static const String appName = 'Food Delivery';
  static const String appVersion = '1.0.0';

  // ==================== CUISINE LANDMARKS ====================
  
  static const Map<String, String> cuisineLandmarks = {
    'Italian': 'assets/images/italian.png',
    'Mexican': 'assets/images/mexican.png',
    'Indian': 'assets/images/india.jpg',
    'Japanese': 'assets/images/japaneseoff.jpg',
    'French': 'assets/images/french.png',
    'American': 'assets/images/american.png',
    'Asian': 'assets/images/japanese.png',
    'Brazilian': 'assets/images/brazil.jpg',
    'Cocktail': 'assets/images/cocktail.png',
    'Greek': 'assets/images/greek.png',
    'Hawaiian': 'assets/images/hawaiian.png',
    'Korean': 'assets/images/korean.png',
    'Lebanese': 'assets/images/lebanese.jpg',
    'Mediterranean': 'assets/images/mediterranean.png',
    'Moroccan': 'assets/images/moroccan.png',
    'Pakistani': 'assets/images/indian.png',
    'Russian': 'assets/images/russia.jpg',
    'Smoothie': 'assets/images/smoothie.png',
    'Spanish': 'assets/images/spanish.jpg',
    'Thai': 'assets/images/japanese.png',
    'Turkish': 'assets/images/turkish.jpg',
    'Vietnamese': 'assets/images/vitnamese.jpg',
    'Chinese': 'assets/images/japanese.png',
  };

  static const String defaultRestaurantImage = 'assets/images/italian.png';
}
