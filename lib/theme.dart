
import 'package:flutter/material.dart';

enum CustomColors {
  main_purple, // for background
  secondary_purple, // timer unselected value
  main_yellow, // buttons
  secondary_yellow, // underline on contact page and gradient to value on timer
  white_text,
  grey_text, // in side menu
  black_text,
  white_icons,
  slider_start,
  slider_end,
  input_hint
}

class CustomTheme {
  static Color? color(CustomColors color) => Color(_getColorCode(color));

  static int _getColorCode(CustomColors color) {
    switch (color) {
      case CustomColors.main_purple:
        return 0x160c25;
      case CustomColors.secondary_purple:
        return 0x211a32;
      case CustomColors.main_yellow:
        return 0xfac234;
      case CustomColors.secondary_yellow:
        return 0x8c6a2f;
      case CustomColors.white_text:
        return 0xffffff;
      case CustomColors.grey_text:
        return 0x4d475b;
      case CustomColors.black_text:
        return 0x000000;
      case CustomColors.white_icons:
        return 0xffffff;
      case CustomColors.slider_start:
        return 0xfabf34;
      case CustomColors.slider_end:
        return 0xf2a245;
      case CustomColors.input_hint:
        return 0x96929e;
    }
  }
}
