import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveler_task/constants/app_constants.dart';

class AppLogo extends StatelessWidget {
  final double fontSize;
  final bool useFontSizeDirectly;

  const AppLogo({
    super.key,
    this.fontSize = 28,
    this.useFontSizeDirectly = false,
  });

  @override
  Widget build(BuildContext context) {
    // Check if we're on a small device
    final deviceWidth = MediaQuery.of(context).size.width;
    final isSmallDevice = deviceWidth < 360;

    // Determine the actual font size to use
    final double actualFontSize =
        useFontSizeDirectly || isSmallDevice ? fontSize : fontSize.sp;

    return Text(
      'logo',
      style: TextStyle(
        color: AppColors.primaryColor,
        fontSize: actualFontSize,
        fontWeight: FontWeight.bold,
        fontFamily: 'Arial',
        letterSpacing: -0.5,
      ),
    );
  }
}
