import 'package:timer/core/route_generator.dart';
import 'package:timer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: CustomTheme.color(CustomColors.main_purple),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  MenuItem(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  MenuItem(
                      icon: SvgPicture.asset('assets/svg/aboutus.svg', color: Colors.white),
                      label: 'About us',
                      onPressed: () {
                        Navigator.pushNamed(context, RouteGenerator.getRoute(ROUTES.ABOUT_US));
                      }),
                  MenuItem(
                      icon: SvgPicture.asset('assets/svg/conversation.svg', color: Colors.white),
                      label: 'Contact',
                      onPressed: () {
                        Navigator.pushNamed(context, RouteGenerator.getRoute(ROUTES.CONTACT));
                      }),
                  MenuItem(
                      icon: SvgPicture.asset('assets/svg/t&c.svg', color: Colors.white),
                      label: 'Privacy Policy',
                      onPressed: () {
                        Navigator.pushNamed(context, RouteGenerator.getRoute(ROUTES.TERMS));
                      })
                ],
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Social media',
                      style: TextStyle(
                        color: CustomTheme.color(CustomColors.grey_text),
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(height: 8),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () => launch('https://www.facebook.com/Ludicus-Games-109247750850870/'),
                      icon: SvgPicture.asset('assets/svg/facebook.svg', color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      height: 1,
                      color: CustomTheme.color(CustomColors.grey_text),
                      width: double.infinity,
                    ),
                    SizedBox(height: 8),
                    Text('LUDICUS GAMES',
                        style: TextStyle(
                          color: CustomTheme.color(CustomColors.grey_text),
                          fontSize: 10,
                        )),
                    SizedBox(height: 8),
                    Text('TIMER APP v 0.1 Alpha',
                        style: TextStyle(
                          color: CustomTheme.color(CustomColors.grey_text),
                          fontSize: 10,
                        ))
                  ],
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
  MenuItem({Key? key, required this.icon, this.label, required this.onPressed}) : super(key: key);

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
