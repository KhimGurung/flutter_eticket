import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eTicket',
      routes: {
        '/' : (context) => LoginScreen(),
      },
      theme: ThemeData(
        primaryColor: Color(0xFFE2E2E2),
        accentColor: Color(0xFF2D3E46),
        backgroundColor: Color(0xFF974246),
      )
    );
  }
}

