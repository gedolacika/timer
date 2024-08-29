import 'package:flutter/material.dart';
import 'package:timer/constants/enums/image_variation.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    required this.image,
    this.quality = ImageQuality.low,
    this.fit,
    this.width,
    this.height,
  });

  final ImageVariation image;

  final ImageQuality quality;

  final BoxFit? fit;

  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image.fullPath(quality: quality),
      fit: fit,
      width: width,
      height: height,
    );
  }
}
