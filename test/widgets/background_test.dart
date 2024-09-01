import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timer/utils/theme_injector_for_tests.dart';
import 'package:timer/widgets/background.dart';

void main() {
  group('Background tests', () {
    String testString = 'Test string';

    Future buildWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        ThemeInjectorForTests(
          child: Scaffold(
            body: AppGeneralBackground(
              key: Key('Key'),
              child: Text(testString),
            ),
          ),
        ),
      );
    }

    testWidgets('Should present the child', (WidgetTester tester) async {
      await buildWidget(tester);
      expect(find.text(testString), findsOneWidget);
    });
  });
}
