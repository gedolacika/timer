import 'package:alpar_counter_app/models/routes.dart';
import 'package:alpar_counter_app/views/about_us.dart';
import 'package:alpar_counter_app/views/contact.dart';
import 'package:alpar_counter_app/views/error.dart';
import 'package:alpar_counter_app/views/home_screen.dart';
import 'package:alpar_counter_app/views/terms.dart';
import 'package:flutter/material.dart';


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

  static String getRoute(RoutePath route) {
    switch (route) {
      case RoutePath.HOME:
        return '/';
      case RoutePath.ABOUT_US:
        return '/aboutUs';
      case RoutePath.CONTACT:
        return '/contact';
      case RoutePath.TERMS:
        return '/terms';
    }
  }
}
