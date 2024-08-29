import 'package:timer/constants/enums/image_variation.dart';
import 'package:timer/theme.dart';
import 'package:flutter/material.dart';
import 'package:timer/widgets/app_image.dart';

class AppGeneralBackground extends StatelessWidget {
  const AppGeneralBackground({required Key key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.color(CustomColors.main_purple),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AppImage(
            image: ImageVariation.maskGroup,
            quality: ImageQuality.high,
            fit: BoxFit.fitHeight,
            height: double.infinity,
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: child,
          ),
        ],
      ),
    );
  }
}
