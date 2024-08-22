import 'package:timer/models/spacing.dart';
import 'package:timer/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer/widgets/margin.dart';
import 'package:timer/widgets/spacer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  static final bool _isFormAllowed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Contact',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: CustomTheme.color(CustomColors.main_yellow),
      ),
      body: Margin.symmetric(
        horizontal: Spacing.small,
        vertical: Spacing.medium,
        child: Container(
          color: CustomTheme.color(CustomColors.main_purple),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ludicus Games SRL',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SpacerWidget.verticalSmall(),
              GestureDetector(
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Colors.white,
                      size: 26,
                    ),
                    SpacerWidget.horizontalSmall(),
                    Text(
                      'info@ludicus.ro',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
                onTap: () => launch('mailto:info@ludicus.ro'),
              ),
              SizedBox(height: 12),
              GestureDetector(
                child: Row(
                  children: [
                    Icon(
                      Icons.public,
                      color: Colors.white,
                      size: 26,
                    ),
                    SpacerWidget.horizontalSmall(),
                    Text(
                      'https://www.ludicusgames.ro',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
                onTap: () => launch('https://www.ludicusgames.ro'),
              ),
              SpacerWidget.verticalLarge(),
              Row(
                children: [
                  SvgPicture.asset('assets/svg/location.svg',
                      color: Colors.white),
                  SpacerWidget.horizontalSmall(),
                  Container(
                    width: 200,
                    child: Text(
                      'Odorheiu Secuiesc, Harghita Str. 1 Decembrie 1918 No.7',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              SpacerWidget.verticalSmall(),
              Container(
                  height: 2, width: double.infinity, color: Colors.yellow),
              SpacerWidget.verticalSmall(),
              GestureDetector(
                onTap: () => launch('tel:+40722435555'),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/phone-call.svg',
                        color: Colors.white),
                    SpacerWidget.horizontalSmall(),
                    Text(
                      '+40-722-435-555',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SpacerWidget.verticalSmall(),
              Container(
                  height: 2,
                  width: double.infinity,
                  color: CustomTheme.color(CustomColors.secondary_yellow)),
              SpacerWidget.verticalSmall(),
              if (_isFormAllowed)
                Expanded(
                  flex: 1,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        // Add TextFormFields and ElevatedButton here.
                        SizedBox(
                          height: 70,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: CustomTheme.color(
                                  CustomColors.secondary_purple),
                              hintText: 'Your Name',
                              hintStyle: TextStyle(
                                color:
                                    CustomTheme.color(CustomColors.input_hint),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: CustomTheme.color(
                                  CustomColors.secondary_purple),
                              hintText: 'Your Name',
                              hintStyle: TextStyle(
                                color:
                                    CustomTheme.color(CustomColors.input_hint),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: double.infinity,
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              minLines: 90,
                              maxLines: 100,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: CustomTheme.color(
                                    CustomColors.secondary_purple),
                                hintText: 'Your Name',
                                hintStyle: TextStyle(
                                  color: CustomTheme.color(
                                      CustomColors.input_hint),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        SpacerWidget.horizontalSmall(),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    CustomTheme.color(
                                        CustomColors.main_yellow)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(36.0)))),
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
