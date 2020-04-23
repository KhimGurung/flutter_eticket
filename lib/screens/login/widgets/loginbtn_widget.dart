import 'package:flutter/material.dart';

class LoginBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 45.0,
      child: FlatButton(
        color: Theme.of(context).accentColor,
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.white,
        splashColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/ticket-list');
        },
        child: Text(
          "LOG IN",
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
