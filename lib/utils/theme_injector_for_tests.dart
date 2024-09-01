
import 'package:flutter/material.dart';
import 'package:timer/utils/theme.dart';

class ThemeInjectorForTests extends StatelessWidget {
  const ThemeInjectorForTests({
    super.key,
    required this.child,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')]
  });
  final Widget child;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme(),
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      locale: const Locale('en'),
      home: Material(
        child: child,
      ),
    );
  }
}
