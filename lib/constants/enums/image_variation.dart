enum ImageVariation {
  aboutus('aboutus'),
  byLudicus('by_ludicus'),
  conversation('conversation'),
  facebook('facebook'),
  information('information'),
  instagram('instagram'),
  location('location'),
  ludicus('ludicus'),
  maskGroup('mask_group'),
  phoneCall('phone-call'),
  replay('replay'),
  replayBackground('replay_background'),
  tAndC('t&c'),
  timerLines('timer_lines');

  final String _assetName;

  String fullPath({ImageQuality quality = ImageQuality.low}) =>
      'assets/png/$_assetName/$_assetName${quality.assetValue}.png';

  const ImageVariation(this._assetName);
}

enum ImageQuality {
  low(''),
  medium('@2x'),
  high('@3x');

  final String assetValue;

  const ImageQuality(this.assetValue);
}
