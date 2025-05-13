import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primaryColor = Color(0xFF3366FF);
  static const Color secondaryColor = Color(0xFF00CCFF);
  static const Color accentColor = Color(0xFFFF6633);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFF999999);

  // Background colors
  static const Color backgroundPrimary = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFF5F5F5);

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
}

class AppSizes {
  // Padding and margin
  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;

  // Border radius
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;

  // Icon sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
}

class AppStrings {
  static const String appName = 'Traveler Task';
  static const String appDescription = 'A Flutter web app for the coding task';
}

class AppAssets {
  // Image paths
  static const String imagesPath = 'assets/images/';

  // Add specific image paths here
  // static const String logoImage = '${imagesPath}logo.png';
}
