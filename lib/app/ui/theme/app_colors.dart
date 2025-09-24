import 'package:flutter/material.dart';

class AppColors {
  // Static colors that don't change with theme
  static const Color accentColor = Color(0xFFC98753); // Brown/orange from logo

  // Theme-aware colors that change based on brightness
  static Color primaryBackground(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;

  static Color secondaryBackground(BuildContext context) =>
      Theme.of(context).cardColor;

  static Color accentForegroundColor(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimary;

  static Color textColor(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

  static Color secondaryTextColor(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black54;
}
