import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
                SizedBox(height: 70.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 35.0),
                  child: Column(
                    children: <Widget>[
                      _username(context),
                      SizedBox(height: 20),
                      _password(context),
                      SizedBox(height: 5,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                            'Forgot password?',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Theme.of(context).primaryColor
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0,),
                      _loginBtn(context),
                      SizedBox(height: 20.0,),
                      Text(
                        "Don't have an account? Sign up.",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Theme.of(context).primaryColor
                        ),
                      ),
                    ],
                  ),
                )
              ],
      ),
          ),
        )
    );
  }
}

Widget _username(context){
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

Widget _password(context){
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

Widget _loginBtn(context){
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
        Navigator.pushReplacementNamed(context, '/home');
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
