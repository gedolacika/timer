
extension DoubleExtensions on double {

  /// This function converts the double value which is represents seconds to human readable min:secs format
  String get toSecondsString {
  int integerValue = this.toInt();
  if (integerValue == 60) {
    return '01:00';
  } else {
    if (integerValue < 10) {
      return '00:0$integerValue';
    } else {
      return '00:$integerValue';
    }
  }
}

}