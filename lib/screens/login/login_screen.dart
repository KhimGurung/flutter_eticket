import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttereticket/screens/login/widgets/username_widget.dart';
import 'package:fluttereticket/screens/login/widgets/password_widget.dart';
import 'package:fluttereticket/screens/login/widgets/loginbtn_widget.dart';

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
                      UsernameField(),
                      SizedBox(height: 20),
                      PasswordField(),
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
                      LoginBtn(),
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

