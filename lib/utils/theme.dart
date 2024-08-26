import 'package:flutter/material.dart';

class AppTheme {
  static theme() {
    ColorScheme scheme = ColorScheme(
        primary: Color(0x160c25), // purple
        onPrimary: Colors.white,
        secondary: Color(0x211a32), // secondary purple
        onSecondary: Color(0x4d475b), // grey text
        surface: Color(0xfac234), // yellow
        onSurface: Colors.white,
        tertiary: Color(0x8c6a2f), // secondary yellow
        onTertiary: Colors.white,
        brightness: Brightness.light,
        error: Colors.red,
        onError: Colors.white);
    TextStyle generalTitleTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: scheme.onPrimary,
    );
    TextStyle generalBodyTextStyle = TextStyle(
      color: scheme.onPrimary,
    );
    return ThemeData(
      primaryColor: Color(0x160c25),
      colorScheme: scheme,
      textTheme: TextTheme(
        headlineLarge: generalTitleTextStyle.copyWith(fontSize: 50),
        headlineMedium: generalTitleTextStyle.copyWith(fontSize: 24),
        headlineSmall: generalTitleTextStyle.copyWith(fontSize: 18),
        bodyLarge: generalBodyTextStyle.copyWith(fontSize: 16),
        bodyMedium: generalBodyTextStyle.copyWith(fontSize: 14),
        bodySmall: generalBodyTextStyle.copyWith(fontSize: 12),
      ),
    );
  }
}
