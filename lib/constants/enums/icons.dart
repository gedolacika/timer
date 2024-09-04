enum IconVariation {
  aboutUs('aboutus'),
  logo('logo'),
  conversation('conversation'),
  facebook('facebook'),
  information('information'),
  instagram('instagram'),
  location('location'),
  phoneCall('phone-call'),
  replay('replay'),
  tAndC('t&c');

  final String _assetName;

  static const _iconRootPathInAssets = 'assets/svg/';
  static const _iconsExtension = '.svg';

  String get path => '$_iconRootPathInAssets$_assetName$_iconsExtension';

  const IconVariation(this._assetName);
}