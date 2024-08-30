import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer/bloc/timer/timer_cubit.dart';
import 'package:timer/constants/enums/icons.dart';
import 'package:timer/constants/enums/image_variation.dart';
import 'package:timer/extensions/build_context.dart';
import 'package:timer/constants/enums/spacing.dart';
import 'package:timer/constants/enums/text_variations.dart';
import 'package:timer/theme.dart';
import 'package:timer/extensions/double_extension.dart';
import 'package:timer/widgets/app_image.dart';
import 'package:timer/widgets/background.dart';
import 'package:timer/widgets/margin.dart';
import 'package:timer/widgets/side_menu.dart';
import 'package:timer/widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timer/widgets/spacer.dart';
import 'package:timer/widgets/typo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  void onInfoButtonTapped() {}

  void _onStartTimer(BuildContext context) {
    context.read<TimerCubit>().onStartTimer();
    _timer = Timer.periodic(
      Duration(seconds: 1),
      context.read<TimerCubit>().timerTicks,
    );
  }

  void _onCancelTimer(BuildContext context) {
    if (_timer != null && _timer?.isActive == true) {
      _timer!.cancel();
      context.read<TimerCubit>().onCancelTimer();
    }
  }

  void _onSubmitButtonPressed(BuildContext context, TimerState state) {
    if (state is TimerInitial && state is! TimerCountingDown) {
      _onStartTimer(context);
    } else if (state is TimerCountingDown) {
      _onCancelTimer(context);
    } else {
      throw ('Something went wrong with timer.\nIn TimerCubit the state have to be initial or counting down');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.color(CustomColors.main_purple),
        title: Typo(context.translations.homeTitle),
      ),
      drawer: SideMenu(),
      body: BlocProvider(
        create: (context) => TimerCubit(),
        child: AppGeneralBackground(
          key: Key('homeScreenAppGeneralBackground'),
          child: BlocBuilder<TimerCubit, TimerState>(
            builder: (context, state) {
              return Align(
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
                                  value: state.countingDownOrNull?.progress
                                          .toDouble() ??
                                      0,
                                  onChange: (value) => context
                                      .read<TimerCubit>()
                                      .onTimerStartTimeChange(value.floor()),
                                  customInnerWidget: state
                                              .countingDownOrNull?.progress !=
                                          null
                                      ? Center(
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Typo(
                                                state.countingDown.progress
                                                    .toSecondsString,
                                                variation:
                                                    TextVariation.headlineLarge,
                                              ),
                                              Align(
                                                alignment: Alignment.center,
                                                child: AppImage(
                                                  image:
                                                      ImageVariation.timerLines,
                                                  quality: ImageQuality.high,
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
                        if (state.initial.startTime != 0 &&
                            state.countingDownOrNull?.progress == null)
                          IconButton(
                            iconSize: 69,
                            onPressed: () async {
                              //Navigator.popAndPushNamed(context, RouteGenerator.getRoute(ROUTES.HOME));
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          HomeScreen(),
                                  transitionDuration: Duration(seconds: 0),
                                ),
                              );
                            },
                            icon: Stack(
                              alignment: Alignment.center,
                              children: [
                                AppImage(
                                  image: ImageVariation.replayBackground,
                                  width: 58,
                                  height: 69,
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 17),
                                    child: SvgPicture.asset(
                                      IconVariation.replay.path,
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
                                  state.countingDownOrNull == null
                                      ? context.translations.homeStartTimerLabel
                                      : context
                                          .translations.homeCancelTimerLabel,
                                  variation: TextVariation.headlineSmall,
                                  color: Colors.black),
                              onPressed: () =>
                                  _onSubmitButtonPressed(context, state),
                              style: ButtonStyle(
                                backgroundColor: state.countingDownOrNull ==
                                        null
                                    ? MaterialStateProperty.all(
                                        CustomTheme.color(
                                            CustomColors.main_yellow))
                                    : MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
