import 'package:timer/views/about_us.dart';
import 'package:timer/views/contact.dart';
import 'package:timer/views/error.dart';
import 'package:timer/views/home_screen.dart';
import 'package:timer/views/terms.dart';
import 'package:flutter/material.dart';

enum ROUTES {
  HOME,
  ABOUT_US,
  CONTACT,
  TERMS,
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/aboutUs':
        return MaterialPageRoute(builder: (_) => AboutUsScreen());
      case '/contact':
        return MaterialPageRoute(builder: (_) => ContactScreen());
      case '/terms':
        return MaterialPageRoute(builder: (_) => TermsScreen());
      default:
        return MaterialPageRoute(builder: (_) => ErrorScreen());
    }
  }

  static String getRoute(ROUTES route) {
    switch (route) {
      case ROUTES.HOME:
        return '/';
      case ROUTES.ABOUT_US:
        return '/aboutUs';
      case ROUTES.CONTACT:
        return '/contact';
      case ROUTES.TERMS:
        return '/terms';
    }
  }
}
