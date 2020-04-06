import 'package:flutter/material.dart';
import 'package:fluttereticket/screens/ticket_list/blocs/tickets_bloc.dart';

class TicketProvider extends InheritedWidget{

  final TicketBloc ticketBloc;

  TicketProvider({Key key, TicketBloc ticketBloc, Widget child})
      : this.ticketBloc = ticketBloc ?? TicketBloc(),
        super(key: key, child: child);


  static TicketBloc of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<TicketProvider>().ticketBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

}