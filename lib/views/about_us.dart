import 'package:alpar_counter_app/theme.dart';
import 'package:alpar_counter_app/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              SizedBox(
                height: 130,
                width: double.infinity,
                child: Image.asset('assets/png/ludicus/ludicus@3x.png'),
              ),
              SizedBox(height: 24),
              Container(height: 1, width: double.infinity, color: CustomTheme.color(CustomColors.main_yellow)),
              SizedBox(height: 16),
              Text(
                'A general timer that measures time in an interval between 1s and 60s.',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 16),
              Text(
                'It will warn you when the set time expires with different sound effects. Suitable for all kinds of activities that require a maximum 1 minute timer. Completely Ad-free.',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 16),
              Text(
                'Note: Only available in English, but requires minimal language skills to set, start and reset the timer.',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 15),
              Text(
                'LUICUS GAMES SRL',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(height: 8),
              Text(
                'ROONRC.J19/140/2016',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(height: 8),
              Text(
                'Odorheiu Secuiesc, Harghita',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(height: 16),
              IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () => launch('https://www.facebook.com/Ludicus-Games-109247750850870/'),
                icon: SvgPicture.asset('assets/svg/facebook.svg', color: Colors.white),
              ),
              SizedBox(height: 8),
              Container(height: 1, width: double.infinity, color: CustomTheme.color(CustomColors.main_yellow)),
              Expanded(flex: 1, child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
