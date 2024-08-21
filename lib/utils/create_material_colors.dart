import 'package:flutter/material.dart';

/// A helper that generates and returns a material color palette.

Color? createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double dynamicShade = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((dynamicShade < 0 ? r : (255 - r)) * dynamicShade).round(),
      g + ((dynamicShade < 0 ? g : (255 - g)) * dynamicShade).round(),
      b + ((dynamicShade < 0 ? b : (255 - b)) * dynamicShade).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch as Map<int, Color>)[500];
}
