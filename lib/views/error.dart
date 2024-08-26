import 'package:flutter/material.dart';
import 'package:timer/extensions/build_context.dart';
import 'package:timer/widgets/typo.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Typo(context.translations.errorScreenTitle),
      ),
      body: Center(
        child: Typo(context.translations.errorScreenTitle),
      ),
    );
  }
}
