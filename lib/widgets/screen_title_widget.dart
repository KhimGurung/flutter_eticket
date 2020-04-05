import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String screenTitle;

  const ScreenTitle(this.screenTitle);

  @override
  Widget build(BuildContext context) {
    return Text(
      screenTitle,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
