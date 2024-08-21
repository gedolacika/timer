import 'package:alpar_counter_app/theme.dart';
import 'package:flutter/material.dart';

class AppGeneralBackground extends StatelessWidget {
  const AppGeneralBackground({required Key key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTheme.color(CustomColors.main_purple),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/png/mask_group/mask_group@3x.png',
            fit: BoxFit.fitHeight,
            height: double.infinity,
          ),
          child,
        ],
      ),
    );
  }
}
