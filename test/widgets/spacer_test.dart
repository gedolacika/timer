import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timer/constants/enums/spacing.dart';
import 'package:timer/utils/theme_injector_for_tests.dart';
import 'package:timer/widgets/spacer.dart';

void main() {
  group('Background tests', () {
    Future buildWidget(WidgetTester tester, Spacing spacing) async {
      await tester.pumpWidget(
        ThemeInjectorForTests(
          child: Scaffold(
            body: SpacerWidget(
              horizontal: spacing,
              vertical: spacing,
            ),
          ),
        ),
      );
    }

    Future buildFactoryWidget(WidgetTester tester, Widget widget) async {
      await tester.pumpWidget(
        ThemeInjectorForTests(
          child: Scaffold(
            body: widget,
          ),
        ),
      );
    }

    testWidgets('Should present the widget with proper spacing',
        (WidgetTester tester) async {
      for (var e in Spacing.values) {
        await buildWidget(tester, e);
        await tester.pumpAndSettle();
        final expectedWidget = tester.widget(find.byType(SizedBox)) as SizedBox;

        expect(expectedWidget.width, e.value);
        expect(expectedWidget.height, e.value);
      }
    });

    testWidgets('Should present the large spacing', (WidgetTester tester) async {
      Spacing spacing = Spacing.large;
      await buildFactoryWidget(tester, SpacerWidget.horizontalLarge());
      var expectedWidget = tester.widget(find.byType(SizedBox)) as SizedBox;
      expect(expectedWidget.width, spacing.value);
      await buildFactoryWidget(tester, SpacerWidget.verticalLarge());
      expectedWidget = tester.widget(find.byType(SizedBox)) as SizedBox;
      expect(expectedWidget.height, spacing.value);
    });

    testWidgets('Should present the medium spacing', (WidgetTester tester) async {
      Spacing spacing = Spacing.medium;
      await buildFactoryWidget(tester, SpacerWidget.horizontalMedium());
      var expectedWidget = tester.widget(find.byType(SizedBox)) as SizedBox;
      expect(expectedWidget.width, spacing.value);
      await buildFactoryWidget(tester, SpacerWidget.verticalMedium());
      expectedWidget = tester.widget(find.byType(SizedBox)) as SizedBox;
      expect(expectedWidget.height, spacing.value);
    });

    testWidgets('Should present the small spacing', (WidgetTester tester) async {
      Spacing spacing = Spacing.small;
      await buildFactoryWidget(tester, SpacerWidget.horizontalSmall());
      var expectedWidget = tester.widget(find.byType(SizedBox)) as SizedBox;
      expect(expectedWidget.width, spacing.value);
      await buildFactoryWidget(tester, SpacerWidget.verticalSmall());
      expectedWidget = tester.widget(find.byType(SizedBox)) as SizedBox;
      expect(expectedWidget.height, spacing.value);
    });

    testWidgets('Should present the tiny spacing', (WidgetTester tester) async {
      Spacing spacing = Spacing.tiny;
      await buildFactoryWidget(tester, SpacerWidget.horizontalTiny());
      var expectedWidget = tester.widget(find.byType(SizedBox)) as SizedBox;
      expect(expectedWidget.width, spacing.value);
      await buildFactoryWidget(tester, SpacerWidget.verticalTiny());
      expectedWidget = tester.widget(find.byType(SizedBox)) as SizedBox;
      expect(expectedWidget.height, spacing.value);
    });
  });
}
