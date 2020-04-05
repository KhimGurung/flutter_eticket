import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.mail,
                size: 20,
                color: Theme.of(context).accentColor,
              ),
            ),
            TextField(
              style: TextStyle(
                  color: Colors.white
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 33.0),
                hasFloatingPlaceholder: false,
                labelText: 'Username',
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
