import 'package:flutter/material.dart';
import 'package:timer/widgets/typo.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Typo('Error'),
      ),
      body: Center(
        child: Typo('ERROR'),
      ),
    );
  }
}
