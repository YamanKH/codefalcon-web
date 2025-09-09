import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart'; // Remove GoogleFonts import

import 'package:code_falcon/app/ui/theme/app_colors.dart';

class AppTextStyles {
  static TextStyle heading1 = const TextStyle(
    fontFamily: 'IBMPlexSansArabic',
    fontSize: 60,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static TextStyle heading2 = const TextStyle(
    fontFamily: 'IBMPlexSansArabic',
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static TextStyle bodyText = const TextStyle(
    fontFamily: 'IBMPlexSansArabic',
    fontSize: 18,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle accentText = const TextStyle(
    fontFamily: 'IBMPlexSansArabic',
    fontSize: 20,
    color: AppColors.accentColor,
    fontWeight: FontWeight.bold,
  );
}