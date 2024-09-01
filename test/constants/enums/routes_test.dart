import 'package:flutter_test/flutter_test.dart';
import 'package:timer/constants/enums/routes.dart';

void main() {
  group('Testing RoutePath', () {
    test('.fromValue factory constructor with good value', () {
      RoutePath path = RoutePath.fromValue(RoutePath.values.first.path);
      expect(path.path, RoutePath.values.first.path);
    });

    test('.fromValue factory constructor with bad value', () {
      expect(() => RoutePath.fromValue('randombadvalue'),
          throwsA(isA<ArgumentError>()));
    });
  });
}
