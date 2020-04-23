import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.lock,
                size: 20,
                color: Theme.of(context).accentColor,
              ),
            ),
            TextField(
              obscureText: true,
              style: TextStyle(
                  color: Colors.white
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 33.0),
                hasFloatingPlaceholder: false,
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: Colors.white
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    )
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
