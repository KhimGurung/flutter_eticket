import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {

  final Function function;
  final String btnText;
  final int btnId;
  final double btnWidth;

  const TabButton({this.function, this.btnText, this.btnId, this.btnWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
      child: GestureDetector(
        onTap: () => function(btnId),
        child: SizedBox(
          width: btnWidth,
          child: Text(
            btnText,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
