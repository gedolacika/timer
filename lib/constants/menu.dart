import 'package:timer/constants/enums/icons.dart';
import 'package:timer/models/menu.dart';
import 'package:timer/constants/enums/routes.dart';

class MenuConstants {
  static List<GeneralMenuItem> main = [
    GeneralMenuItem(
      icon: IconVariation.aboutUs,
      label: 'About us',
      route: RoutePath.about,
    ),
    GeneralMenuItem(
      icon: IconVariation.conversation,
      label: 'Contact',
      route: RoutePath.contact,
    ),
    GeneralMenuItem(
      icon: IconVariation.tAndC,
      label: 'Privacy Policy',
      route: RoutePath.terms,
    )
  ];

  static List<SocialMenuItem> socials = [
    SocialMenuItem(
      'https://facebook.com',
      icon: IconVariation.facebook,
    )
  ];

  static const versionAndName = 'TIMER APP v 0.1 Alpha';
  static const appName = 'Timer Games';
}
