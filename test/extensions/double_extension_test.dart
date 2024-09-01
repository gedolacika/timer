import 'package:flutter_test/flutter_test.dart';
import 'package:timer/extensions/double_extension.dart';

void main() {
  group('Testing double and int extensions', () {
    test(' double extension', () {
      double value = 60.0;
      expect('01:00', value.toSecondsString);
      value = 15.0;
      expect('00:15', value.toSecondsString);
      value = 8.0;
      expect('00:08', value.toSecondsString);
    });

    test(' int extension', () {
      int value = 60;
      expect('01:00', value.toSecondsString);
      value = 15;
      expect('00:15', value.toSecondsString);
      value = 8;
      expect('00:08', value.toSecondsString);
    });
  });
}
