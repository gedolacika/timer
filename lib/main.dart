import 'dart:io';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timer/core/route_generator.dart';
import 'package:timer/utils/theme.dart';
import 'package:timer/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
      ],
      theme: AppTheme.theme(),
      home: HomeScreen(),
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
