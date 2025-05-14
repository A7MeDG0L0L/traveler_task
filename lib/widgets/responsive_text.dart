import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool useMobileScaling;

  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.useMobileScaling = true,
  });

  @override
  Widget build(BuildContext context) {
    // Get device width to determine if we're on mobile
    final deviceWidth = MediaQuery.of(context).size.width;
    final isMobile = deviceWidth < 600;
    final isSmallMobile = deviceWidth < 360;

    // Base style from the provided style or default
    final TextStyle baseStyle = style ?? const TextStyle();

    // Calculate the responsive font size
    double? fontSize;
    if (baseStyle.fontSize != null) {
      if (isMobile && useMobileScaling) {
        // For mobile, use direct scaling with a minimum size
        fontSize = isSmallMobile
            ? (baseStyle.fontSize! * 0.85).clamp(10.0, double.infinity)
            : baseStyle.fontSize;
      } else {
        // For tablets and desktops, use ScreenUtil scaling
        fontSize = baseStyle.fontSize!.sp;
      }
    }

    // Create the responsive style
    final responsiveStyle = baseStyle.copyWith(fontSize: fontSize);

    return Text(
      text,
      style: responsiveStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
