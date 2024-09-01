import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timer/constants/menu.dart';
import 'package:timer/utils/theme_injector_for_tests.dart';
import 'package:timer/widgets/side_menu.dart';

void main() {
  group('Side menu tests', () {
    Future buildWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        ThemeInjectorForTests(
          child: Scaffold(
            body: SideMenu(),
          ),
        ),
      );
    }

    testWidgets('Should present all main menu items from constants', (WidgetTester tester) async {
      await buildWidget(tester);await tester.pumpAndSettle();
      MenuConstants.main.forEach((e) {
        expect(find.text(e.label), findsOneWidget);
      });
    });
  });
}
