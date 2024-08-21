import 'package:timer/models/menu.dart';
import 'package:timer/models/routes.dart';

class MenuConstants {
  static List<Menu> main = [
    Menu(
      icon: 'assets/svg/aboutus.svg',
      label: 'About us',
      route: RoutePath.about,
    ),
    Menu(
      icon: 'assets/svg/conversation.svg',
      label: 'Contact',
      route: RoutePath.contact,
    ),
    Menu(
      icon: 'assets/svg/t&c.svg',
      label: 'Privacy Policy',
      route: RoutePath.terms,
    )
  ];
}
