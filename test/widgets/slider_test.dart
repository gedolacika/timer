import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:timer/utils/theme_injector_for_tests.dart';
import 'package:timer/widgets/slider.dart';
import 'package:timer/widgets/typo.dart';

void main() {
  group('Slider tests', () {

    Future buildWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        ThemeInjectorForTests(
          child: Scaffold(
            body: CustomSlider(
              key: Key('Key'),
              value: 5,
              maxValue: 60,
              onChange: (value) => {},
              customInnerWidget: Typo('Inner widget'),
            ),
          ),
        ),
      );
    }

    testWidgets('Should present the slider', (WidgetTester tester) async {
      await buildWidget(tester);
      expect(find.byType(SleekCircularSlider), findsOneWidget);
    });
  });
}
