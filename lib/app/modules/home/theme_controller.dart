import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  var isDarkMode = true.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  static ThemeData get darkTheme {
    const primary = Color(0xFFC98753);
    const scaffold = Color(0xFF121212);
    const surface = Color(0xFF1E1E1E);
    final base = ThemeData(brightness: Brightness.dark);
    final colorScheme = base.colorScheme.copyWith(
      primary: primary,
      secondary: primary,
      surface: surface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: const Color(0xFFF8F9FA),
    );

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primary,
      scaffoldBackgroundColor: scaffold,
      cardColor: surface,
      appBarTheme: const AppBarTheme(
        backgroundColor: scaffold,
      ),
      textTheme: base.textTheme.copyWith(
        bodyLarge: const TextStyle(color: Color(0xFFF8F9FA)),
        bodyMedium: const TextStyle(color: Color(0xFFB0B3B8)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Color(0xFFF8F9FA)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: primary),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primary),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    const primary = Color(0xFFC98753);
    const scaffold = Colors.white;
    const surface = Color(0xFFF5F5F5);
    final base = ThemeData(brightness: Brightness.light);
    final colorScheme = base.colorScheme.copyWith(
      primary: primary,
      secondary: primary,
      surface: surface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black87,
    );

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primary,
      scaffoldBackgroundColor: scaffold,
      cardColor: surface,
      appBarTheme: const AppBarTheme(
        backgroundColor: scaffold,
      ),
      textTheme: base.textTheme.copyWith(
        bodyLarge: const TextStyle(color: Colors.black87),
        bodyMedium: const TextStyle(color: Colors.black54),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.black87),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: primary),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primary),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
    );
  }
}
