import 'dart:async';
import 'dart:math';
import 'package:timer/extensions/build_context.dart';
import 'package:timer/constants/enums/spacing.dart';
import 'package:timer/constants/enums/text_variations.dart';
import 'package:timer/theme.dart';
import 'package:timer/utils/string_parser.dart';
import 'package:timer/widgets/background.dart';
import 'package:timer/widgets/margin.dart';
import 'package:timer/widgets/side_menu.dart';
import 'package:timer/widgets/slider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer/widgets/spacer.dart';
import 'package:timer/widgets/typo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _timerValueByUser = 0;
  Timer? _timer;
  double? _timerValue;
  Random _random = new Random();

  void onInfoButtonTapped() {}

  void onCancelTapped() {
    if (_timer != null && _timer!.isActive) {
      _timer?.cancel();
      setState(() {
        _timerValue = null;
        _timerValueByUser = 0;
      });
    }
  }

  void onGoTapped() {
    if (_timerValue == null) {
      setState(() {
        _timerValue = _timerValueByUser;
        _timer = Timer.periodic(Duration(seconds: 1), (timer) {
          print(_timerValue);
          if (_timerValue != 0) {
            setState(() {
              _timerValue = _timerValue! - 1.0;
            });
          } else {
            int randValue = _random.nextInt(40) + 1;
            AssetsAudioPlayer.newPlayer().open(
              Audio("assets/sounds/$randValue.mp3"),
              autoStart: true,
            );
            _timer!.cancel();
            setState(() {
              _timerValue = null;
              _timerValueByUser = 0;
            });
          }
        });
      });
    }
  }

  void _onSliderValueChange(double value) {
    print(value);
    setState(() {
      _timerValueByUser = value.floorToDouble();
    });
  }

  String secondsToMinutesString(double value) {
    int minutes = (value / 60).floor();
    int seconds = (value % 60).toInt();
    if (minutes < 10) {
      if (seconds < 10) {
        return '0$minutes:0$seconds';
      } else {
        return '0$minutes:$seconds';
      }
    } else {
      if (seconds < 10) {
        return '$minutes:0$seconds';
      } else {
        return '$minutes:$seconds';
      }
    }
  }

  Widget instanciateCustomSlider() {
    return CustomSlider(
      maxValue: _timerValue == null ? 60 : 3600,
      value: _timerValue ?? 0,
      onChange: _onSliderValueChange,
      customInnerWidget: _timerValue != null
          ? Center(
              child: Typo(
                secondsToMinutesString(_timerValue!),
                variation: TextVariation.headlineLarge,
              ),
            )
          : null,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.color(CustomColors.main_purple),
        title: Typo(context.translations.homeTitle),
      ),
      drawer: SideMenu(),
      body: AppGeneralBackground(
        key: Key('homeScreenAppGeneralBackground'),
        child: Align(
          alignment: Alignment.center,
          child: Margin.symmetric(
            horizontal: Spacing.tiny,
            vertical: Spacing.small,
            child: Margin(
              top: Spacing.large,
              child: Column(
                children: [
                  Typo(
                    context.translations.homeTimerTitle,
                    textAlign: TextAlign.center,
                    variation: TextVariation.headlineSmall,
                  ),
                  SpacerWidget.verticalLarge(),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          child: CustomSlider(
                            maxValue: 61,
                            value: _timerValue ?? 0,
                            onChange: _onSliderValueChange,
                            customInnerWidget: _timerValue != null
                                ? Center(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Typo(
                                          secondsToSecondsString(_timerValue!),
                                          variation:
                                              TextVariation.headlineLarge,
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/png/timer_lines/timer_lines@3x.png',
                                            width: 205,
                                            height: 205,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpacerWidget.verticalTiny(),
                  if (_timerValueByUser != 0 && _timerValue == null)
                    IconButton(
                      iconSize: 69,
                      onPressed: () async {
                        //Navigator.popAndPushNamed(context, RouteGenerator.getRoute(ROUTES.HOME));
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                HomeScreen(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                      icon: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/png/replay_background/replay_background@3x.png',
                            width: 58,
                            height: 69,
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(top: 17),
                              child: SvgPicture.asset(
                                'assets/svg/replay.svg',
                                color: Colors.white,
                                width: 36,
                                height: 40,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  Expanded(flex: 1, child: Container()),
                  Margin(
                    left: Spacing.small,
                    right: Spacing.small,
                    bottom: Spacing.medium,
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        child: Typo(
                            _timerValue == null
                                ? context.translations.homeStartTimerLabel
                                : context.translations.homeCancelTimerLabel,
                            variation: TextVariation.headlineSmall,
                            color: Colors.black),
                        onPressed:
                            _timerValue == null ? onGoTapped : onCancelTapped,
                        style: ButtonStyle(
                          backgroundColor: _timerValue == null
                              ? MaterialStateProperty.all(
                                  CustomTheme.color(CustomColors.main_yellow))
                              : MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              side: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
