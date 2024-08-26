import 'package:flutter/material.dart';
import 'package:timer/models/text_variations.dart';

class Typo extends StatelessWidget {
  const Typo(this.text,
      {super.key, this.variation = TextVariation.bodyMedium, this.color});

  final String text;

  final TextVariation variation;

  final Color? color;

  TextStyle _style(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    TextStyle? style = switch (variation) {
      TextVariation.headlineLarge => theme.headlineLarge,
      TextVariation.headlineMedium => theme.headlineLarge,
      TextVariation.headlineSmall => theme.headlineLarge,
      TextVariation.bodyLarge => theme.headlineLarge,
      TextVariation.bodyMedium => theme.headlineLarge,
      TextVariation.bodySmall => theme.headlineLarge,
    };
    if (style == null) {
      throw ('Error in Typo widget when looking for general text style. TextStyle is null, please define it in the theme.');
    }
    return style;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle style = _style(context);
    if (color != null) {
      style = style.copyWith(color: color);
    }
    return Text(
      text,
      style: style,
    );
  }
}
