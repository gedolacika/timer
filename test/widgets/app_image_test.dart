import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timer/constants/enums/image_variation.dart';
import 'package:timer/utils/theme_injector_for_tests.dart';
import 'package:timer/widgets/app_image.dart';

void main() {
  group('AppImage tests', () {
    ImageVariation image = ImageVariation.aboutus;
    double width = 200;
    double height = 200;
    BoxFit fit = BoxFit.fill;

    Future buildWidget(WidgetTester tester) async {
      await tester.pumpWidget(
        ThemeInjectorForTests(
          child: Scaffold(
            body: AppImage(
              image: image,
              width: width,
              height: height,
              fit: fit,
            ),
          ),
        ),
      );
    }

    testWidgets('Should render the widget', (WidgetTester tester) async {
      await buildWidget(tester);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('Should use the width, height and fit parameters', (WidgetTester tester) async {
      await buildWidget(tester);
        final expectedWidget = tester.widget(find.byType(Image)) as Image;
        expect(expectedWidget.width, width);
        expect(expectedWidget.height, height);
        expect(expectedWidget.fit, fit);
    });
  });
}
