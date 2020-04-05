import 'package:flutter/material.dart';
import 'package:fluttereticket/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eTicket',
      theme: ThemeData(
        primaryColor: Color(0xFFE2E2E2),
        accentColor: Color(0xFF2D3E46),
        backgroundColor: Color(0xFF974246),
      ),
      initialRoute: '/login',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

