import 'package:timer/constants/menu.dart';
import 'package:timer/models/routes.dart';
import 'package:timer/models/spacing.dart';
import 'package:timer/models/text_variations.dart';
import 'package:timer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer/widgets/margin.dart';
import 'package:timer/widgets/spacer.dart';
import 'package:timer/widgets/typo.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  void navigate(RoutePath route) {
    Navigator.pushNamed(context, route.path);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: CustomTheme.color(CustomColors.main_purple),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                  children: MenuConstants.main
                      .map((e) => MenuItem(
                            icon: SvgPicture.asset(e.icon.path,
                                color: Colors.white),
                            label: e.label,
                            onPressed: () => navigate(e.route),
                          ))
                      .toList()),
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Margin.small(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Typo('Social media',
                          variation: TextVariation.bodySmall,
                          color: CustomTheme.color(CustomColors.grey_text)),
                      SpacerWidget.verticalTiny(),
                      ...MenuConstants.socials
                          .map(
                            (e) => IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () => launchUrl(
                                Uri.dataFromString(e.url),
                              ),
                              icon: SvgPicture.asset(e.icon.path,
                                  color: Colors.white),
                            ),
                          )
                          .toList(),
                      SpacerWidget.verticalTiny(),
                      Margin.symmetric(
                        horizontal: Spacing.tiny,
                        child: Container(
                          height: 1,
                          color: CustomTheme.color(CustomColors.grey_text),
                          width: double.infinity,
                        ),
                      ),
                      SpacerWidget.verticalTiny(),
                      Typo(
                        MenuConstants.appName,
                        variation: TextVariation.bodySmall,
                        color: CustomTheme.color(CustomColors.grey_text),
                      ),
                      SpacerWidget.verticalTiny(),
                      Typo(
                        MenuConstants.versionAndName,
                        variation: TextVariation.bodySmall,
                        color: CustomTheme.color(CustomColors.grey_text),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  MenuItem({Key? key, required this.icon, this.label, required this.onPressed})
      : super(key: key);

  final Widget icon;
  final String? label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
        child: Row(
          children: <Widget>[
            icon,
            SizedBox(width: 12),
            if (label != null)
              Text(
                label!,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
