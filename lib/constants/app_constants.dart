import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primaryColor = Color(0xFFFFC268); // Logo color (golden)
  static const Color secondaryColor = Color(0xFF000000); // Black
  static const Color accentColor = Color(0xFF333333); // Dark gray

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textLight = Color(0xFF999999);

  // Background colors
  static const Color backgroundPrimary = Color(0xFF000000); // Black background
  static const Color backgroundSecondary =
      Color(0xFF111111); // Dark gray background
  static const Color cardBackground = Color(0xFF1A1A1A); // Card background

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // UI specific colors
  static const Color pendingApproval =
      Color(0xFF444444); // Gray badge background
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

  // Card sizes
  static const double cardHeight = 450.0;
  static const double cardWidth = 250.0;
}

class AppStrings {
  static const String appName = 'Traveler Task';
  static const String appDescription = 'A Flutter web app for the coding task';

  // Navigation items
  static const List<String> navItems = [
    'Items',
    'Pricing',
    'Info',
    'Tasks',
    'Analytics'
  ];
}

class AppAssets {
  // Image paths
  static const String imagesPath = 'assets/images/';

  // Logo
  static const String logoImage = 'logo';
}
