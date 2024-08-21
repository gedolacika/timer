String secondsToSecondsString(double value) {
  int integerValue = value.toInt();
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
