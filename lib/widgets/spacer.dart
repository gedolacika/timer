import 'package:flutter/material.dart';
import 'package:timer/models/spacing.dart';

class SpacerWidget extends StatelessWidget {
  const SpacerWidget(
      {super.key,
      this.vertical = Spacing.none,
      this.horizontal = Spacing.none});

  final Spacing vertical, horizontal;

  SpacerWidget.horizontalTiny()
      : horizontal = Spacing.tiny,
        vertical = Spacing.none;

  SpacerWidget.horizontalSmall()
      : horizontal = Spacing.small,
        vertical = Spacing.none;

  SpacerWidget.horizontalMedium()
      : horizontal = Spacing.medium,
        vertical = Spacing.none;

  SpacerWidget.horizontalLarge()
      : horizontal = Spacing.large,
        vertical = Spacing.none;

  SpacerWidget.verticalTiny()
      : vertical = Spacing.tiny,
        horizontal = Spacing.none;

  SpacerWidget.verticalSmall()
      : vertical = Spacing.small,
        horizontal = Spacing.none;

  SpacerWidget.verticalMedium()
      : vertical = Spacing.medium,
        horizontal = Spacing.none;

  SpacerWidget.verticalLarge()
      : vertical = Spacing.large,
        horizontal = Spacing.none;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: horizontal.value,
      height: vertical.value,
    );
  }
}
