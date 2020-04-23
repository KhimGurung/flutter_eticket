import 'package:flutter/material.dart';
import 'package:fluttereticket/route_generator.dart';
import 'package:fluttereticket/screens/ticket_list/bloc_providers/tickets_bloc_provider.dart';
import 'package:fluttereticket/screens/ticket_list/blocs/tickets_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return TicketProvider(
      ticketBloc: TicketBloc(),
      child: MaterialApp(
        title: 'eTicket',
        theme: ThemeData(
          primaryColor: Color(0xFFE2E2E2),
          accentColor: Color(0xFF2D3E46),
          backgroundColor: Color(0xFF974246),
        ),
        initialRoute: '/login',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

