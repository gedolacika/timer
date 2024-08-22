import 'package:timer/models/spacing.dart';
import 'package:timer/theme.dart';
import 'package:timer/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer/widgets/margin.dart';
import 'package:timer/widgets/spacer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'About us',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: CustomTheme.color(CustomColors.main_yellow),
      ),
      body: AppGeneralBackground(
        key: Key('aboutUsAppGeneralBackground'),
        child: Margin.symmetric(
          horizontal: Spacing.tiny,
          vertical: Spacing.small,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpacerWidget.verticalLarge(),
              SizedBox(
                height: 130,
                width: double.infinity,
                child: Image.asset('assets/png/ludicus/ludicus@3x.png'),
              ),
              SpacerWidget.verticalMedium(),
              Container(height: 1, width: double.infinity, color: CustomTheme.color(CustomColors.main_yellow)),
              SpacerWidget.verticalSmall(),
              Text(
                'A general timer that measures time in an interval between 1s and 60s.',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SpacerWidget.verticalSmall(),
              Text(
                'It will warn you when the set time expires with different sound effects. Suitable for all kinds of activities that require a maximum 1 minute timer. Completely Ad-free.',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SpacerWidget.verticalSmall(),
              Text(
                'Note: Only available in English, but requires minimal language skills to set, start and reset the timer.',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SpacerWidget.verticalSmall(),
              Text(
                'LUICUS GAMES SRL',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SpacerWidget.verticalTiny(),
              Text(
                'ROONRC.J19/140/2016',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SpacerWidget.verticalTiny(),
              Text(
                'Odorheiu Secuiesc, Harghita',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SpacerWidget.verticalSmall(),
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () => launch('https://www.facebook.com/Ludicus-Games-109247750850870/'),
                icon: SvgPicture.asset('assets/svg/facebook.svg', color: Colors.white),
              ),
              SpacerWidget.verticalTiny(),
              Container(height: 1, width: double.infinity, color: CustomTheme.color(CustomColors.main_yellow)),
              Expanded(flex: 1, child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
