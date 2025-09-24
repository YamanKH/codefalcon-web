import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart'; // Remove GoogleFonts import

import 'package:code_falcon/app/ui/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle heading1(BuildContext context) => TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor(context),
      );

  static TextStyle heading2(BuildContext context) => TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor(context),
      );

  static TextStyle heading3(BuildContext context) => TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor(context),
      );

  static TextStyle bodyText(BuildContext context) => TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 18,
        color: AppColors.secondaryTextColor(context),
      );

  static TextStyle accentText(BuildContext context) => TextStyle(
        fontFamily: 'IBMPlexSansArabic',
        fontSize: 20,
        color: AppColors.accentColor,
        fontWeight: FontWeight.bold,
      );
}
