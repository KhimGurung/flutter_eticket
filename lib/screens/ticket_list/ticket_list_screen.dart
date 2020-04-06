import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttereticket/screens/ticket_list/bloc_providers/tickets_bloc_provider.dart';
import 'package:fluttereticket/screens/ticket_list/blocs/tickets_bloc.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/drawer_navigation_widget.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/tab_button_widget.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/ticket_widget.dart';
import 'package:fluttereticket/widgets/screen_title_widget.dart';
import 'package:fluttereticket/models/show_tickets.dart';
import 'package:fluttereticket/models/travel_tickets.dart';
import 'package:fluttereticket/models/visit_tickets.dart';

class TicketListScreen extends StatefulWidget {
  @override
  _TicketListScreenState createState() => _TicketListScreenState();
}

class _TicketListScreenState extends State<TicketListScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  double _indicatorWidth = 70;
  double _indicatorX = 16;

  @override
  Widget build(BuildContext context) {
    final ticketBloc = TicketProvider.of(context);

    Function  _selectTicketTab = (int btnId){
      setState((){
        if(btnId == 1){
          _indicatorWidth = 70;
          _indicatorX = 16;
          ticketBloc.ticketFilterSink.add(TicketFilterEvent.valid);
        }
        else if(btnId == 2){
          _indicatorWidth = 90;
          _indicatorX = 106;
          ticketBloc.ticketFilterSink.add(TicketFilterEvent.expired);
        }
        else if(btnId == 3){
          _indicatorWidth = 50;
          _indicatorX = 216;
          ticketBloc.ticketFilterSink.add(TicketFilterEvent.all);
        }
      });
    };

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: (){
            _scaffoldKey.currentState.openDrawer();
          },
        )
      ),
      drawer: DrawerNavigation(),
      body: Stack(
        children: <Widget>[
          Container(
            height: 161,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                child: ScreenTitle("Tickets"),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:0.0, horizontal: 16.0),
                child: Row(
                  children: <Widget>[
                    TabButton(
                      function: _selectTicketTab,
                      btnId: 1,
                      btnText: "Valid",
                      btnWidth: 70,
                    ),
                    TabButton(
                      function: _selectTicketTab,
                      btnId: 2,
                      btnText: "Expired",
                      btnWidth: 90,
                    ),
                    TabButton(
                      function: _selectTicketTab,
                      btnId: 3,
                      btnText: "All",
                      btnWidth: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0,),
              Stack(
                  children: <Widget>[
                    Container(
                      height: 3.0,
                      decoration: BoxDecoration(
                          color: Color(0xFFAF474C)
                      ),
                    ),
                    AnimatedPositioned(
                      left: _indicatorX,
                      duration: Duration(milliseconds: 300),
                      child: AnimatedContainer(
                        height: 3.0,
                        width: _indicatorWidth,
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ]
              ),
              Container(
                child: Flexible(
                  flex: 1,
                  child: StreamBuilder<UnmodifiableListView<dynamic>>(
                    stream: ticketBloc.ticketListStream,
                    initialData: UnmodifiableListView<dynamic>([]),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index){
                          if(snapshot.data[index] is ShowTicket){
                            return Ticket(ticket: snapshot.data[index]);
                          } else if(snapshot.data[index] is TravelTicket){
                            return Ticket(ticket: snapshot.data[index]);
                          }else if(snapshot.data[index] is VisitTicket){
                            return Ticket(ticket: snapshot.data[index]);
                          }else{
                            return Ticket(ticket: snapshot.data[index]);
                          }
                        },
                      );
                    }
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}



