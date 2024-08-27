import 'package:timer/constants/enums/routes.dart';
import 'package:timer/views/about_us.dart';
import 'package:timer/views/contact.dart';
import 'package:timer/views/error.dart';
import 'package:timer/views/home_screen.dart';
import 'package:timer/views/terms.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    RoutePath path;
    try {
      path = RoutePath.fromValue(settings.name!);
    } catch(e) {
      return MaterialPageRoute(builder: (_) => ErrorScreen());
    }

    switch (path) {
      case RoutePath.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutePath.about:
        return MaterialPageRoute(builder: (_) => AboutUsScreen());
      case RoutePath.contact:
        return MaterialPageRoute(builder: (_) => ContactScreen());
      case RoutePath.terms:
        return MaterialPageRoute(builder: (_) => TermsScreen());
    }
  }
}
