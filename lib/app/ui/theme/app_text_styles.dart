import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart'; // Remove GoogleFonts import

import 'package:code_falcon/app/ui/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle heading1(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontSize: isSmallScreen ? 40 : 60,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor(context),
    );
  }

  static TextStyle heading2(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontSize: isSmallScreen ? 28 : 40,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor(context),
    );
  }

  static TextStyle heading3(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontSize: isSmallScreen ? 20 : 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor(context),
    );
  }

  static TextStyle bodyText(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontSize: isSmallScreen ? 16 : 18,
      color: AppColors.secondaryTextColor(context),
    );
  }

  static TextStyle accentText(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return TextStyle(
      fontFamily: 'IBMPlexSansArabic',
      fontSize: isSmallScreen ? 18 : 20,
      color: AppColors.accentColor,
      fontWeight: FontWeight.bold,
    );
  }
}
