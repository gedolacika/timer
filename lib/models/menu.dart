import 'package:timer/models/icons.dart';
import 'package:timer/models/routes.dart';

class GeneralMenuItem extends BaseMenu {
  final String label;
  final RoutePath route;

  const GeneralMenuItem(
      {required IconVariation icon, required this.label, required this.route})
      : super(icon);
}

class SocialMenuItem extends BaseMenu {
  final String url;

  const SocialMenuItem(this.url, {required IconVariation icon}) : super(icon);
}

class BaseMenu {
  final IconVariation icon;

  const BaseMenu(this.icon);
}
