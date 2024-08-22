import 'package:flutter/material.dart';
import 'package:timer/models/spacing.dart';

class Margin extends StatelessWidget {
  const Margin({
    super.key,
    required this.child,
    this.top = Spacing.none,
    this.left = Spacing.none,
    this.bottom = Spacing.none,
    this.right = Spacing.none,
  });

  final Spacing top, left, bottom, right;

  final Widget child;

  factory Margin.symmetric({
    Spacing horizontal = Spacing.none,
    Spacing vertical = Spacing.none,
    required Widget child,
  }) =>
      Margin(
        left: horizontal,
        right: horizontal,
        top: vertical,
        bottom: vertical,
        child: child,
      );

  factory Margin.small({
    required Widget child,
  }) =>
      Margin(
        left: Spacing.small,
        right: Spacing.small,
        top: Spacing.small,
        bottom: Spacing.small,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        left.value,
        top.value,
        right.value,
        bottom.value,
      ),
      child: child,
    );
  }
}
