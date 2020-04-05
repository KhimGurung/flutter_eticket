import 'package:flutter/material.dart';
import 'package:fluttereticket/screens/login/login_screen.dart';
import 'package:fluttereticket/screens/ticket_detail/ticket_detail_screen.dart';
import 'package:fluttereticket/screens/ticket_list/ticket_list_screen.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){

    final args = settings.arguments;

    switch(settings.name){
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/ticket-list':
        return MaterialPageRoute(builder: (_) => TicketListScreen());
      case '/ticket-detail':
        return MaterialPageRoute(
            builder: (_) => TicketDetailScreen(
              ticket : args,
            ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}