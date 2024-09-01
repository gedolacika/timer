
enum RoutePath {
  home('/'),
  about('/aboutUs'),
  contact('/contact'),
  terms('/terms');

  final String path;

  const RoutePath(this.path);

  factory RoutePath.fromValue(String value) {
    RoutePath? route = RoutePath.values.where((e) => e.path == value).firstOrNull;
    if(route == null) {
      throw ArgumentError('Failed to transform $value to RoutePath enum instance.');
    }
    return route;
  }
}