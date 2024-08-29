import 'package:timer/constants/enums/image_variation.dart';
import 'package:timer/constants/enums/text_variations.dart';
import 'package:timer/theme.dart';
import 'package:timer/extensions/double_extension.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:timer/widgets/app_image.dart';
import 'package:timer/widgets/typo.dart';

class CustomSlider extends StatefulWidget {
  CustomSlider({
    Key? key,
    required this.value,
    required this.onChange,
    required this.maxValue,
    this.customInnerWidget,
  }) : super(key: key);
  final double value;
  final Function onChange;
  final Widget? customInnerWidget;
  final int maxValue;

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    if (widget.customInnerWidget != null) {
      return Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _Slider(
              value: widget.value,
              onChange: widget.onChange,
              maxValue: widget.maxValue,
              customInnerWidget: widget.customInnerWidget,
            ),
            Container(width: double.infinity, height: double.infinity)
          ],
        ),
      );
    }
    return _Slider(
      value: widget.value,
      onChange: widget.onChange,
      maxValue: widget.maxValue,
    );
  }
}

class _Slider extends StatelessWidget {
  _Slider({
    Key? key,
    required this.value,
    required this.onChange,
    this.customInnerWidget,
    required this.maxValue,
  }) : super(key: key);
  final double value;
  final Function onChange;
  final Widget? customInnerWidget;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      min: 0,
      max: maxValue.toDouble(),
      initialValue: value,
      appearance: CircularSliderAppearance(
        angleRange: 360,
        startAngle: 270,
        size: 250,
        customWidths: CustomSliderWidths(
          progressBarWidth: 18,
          trackWidth: 14,
        ),
        customColors: CustomSliderColors(
          trackColor: CustomTheme.color(CustomColors.secondary_purple),
          progressBarColors: [
            CustomTheme.color(CustomColors.slider_start)!,
            CustomTheme.color(CustomColors.slider_end)!,
          ],
          gradientStartAngle: 90,
          gradientEndAngle: 180,
        ),
      ),
      onChange: (double value) {
        if (customInnerWidget == null) {
          onChange(value);
        }
      },
      innerWidget: (double value) {
        if (customInnerWidget != null) {
          return customInnerWidget!;
        }
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Typo(
                value.toSecondsString,
                variation: TextVariation.headlineLarge,
              ),
              Align(
                alignment: Alignment.center,
                child: AppImage(
                  image: ImageVariation.timerLines,
                  quality: ImageQuality.high,
                  width: 205,
                  height: 205,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
