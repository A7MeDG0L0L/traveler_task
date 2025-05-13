import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    // If width is more than 1100, it's considered desktop
    if (size.width >= 1100) {
      return desktop;
    }
    // If width is between 650 and 1100, it's considered tablet
    else if (size.width >= 650) {
      return tablet ?? desktop;
    }
    // If width is less than 650, it's considered mobile
    else {
      return mobile;
    }
  }
}
