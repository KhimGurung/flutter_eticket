import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttereticket/icons/flutter_icon_icons.dart';
import 'package:fluttereticket/models/tickets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluttereticket/models/showTickets.dart';
import 'package:fluttereticket/models/partyTickets.dart';
import 'package:fluttereticket/models/travelTickets.dart';
import 'package:fluttereticket/models/visitTickets.dart';

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
      drawer: _drawerNavigation(context),
      body: _body(context)
    );
  }

  Widget _body(BuildContext context){

    void _selectTicketTab(int validity){
      setState((){
        if(validity == 1){
          _indicatorWidth = 70;
          _indicatorX = 16;
        }
        if(validity == 2){
          _indicatorWidth = 90;
          _indicatorX = 106;
        }
        if(validity == 3){
          _indicatorWidth = 50;
          _indicatorX = 216;
        }
      });
    }

    return Stack(
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
              child: Text(
                "Tickets",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:0.0, horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                    child: GestureDetector(
                      onTap: () => _selectTicketTab(1),
                      child: SizedBox(
                        width: 70,
                        child: Text(
                          'Valid',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                    child: GestureDetector(
                      onTap: () => _selectTicketTab(2),
                      child: SizedBox(
                        width: 90,
                        child: Text(
                          'Expired',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                    child: GestureDetector(
                      onTap: () => _selectTicketTab(3),
                      child: SizedBox(
                        width: 50,
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
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
                child: ListView.builder(
                  itemCount: tickets.length,
                  itemBuilder: (context, index){

                    if(tickets[index] is ShowTicket){
                      return _renderTicket(tickets[index]);
                    } else if(tickets[index] is TravelTicket){
                      return _renderTicket(tickets[index]);
                    }else if(tickets[index] is VisitTicket){
                      return _renderTicket(tickets[index]);
                    }else{
                      return _renderTicket(tickets[index]);
                    }
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _renderTicket(dynamic ticket){

    AssetImage _ticketCategoryIcon(dynamic ticket){

      if(ticket is ShowTicket){
        return AssetImage('assets/images/show.png');
      } else if(ticket is TravelTicket){
        return AssetImage('assets/images/travel.png');
      }else if(ticket is VisitTicket){
        return AssetImage('assets/images/visit.png');
      }else{
        return AssetImage('assets/images/party.png');
      }

    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 14.0),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.black38,
              blurRadius: 7.0,
              offset: Offset(
                0.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            )]
        ),
        child: CustomPaint(
          painter: TicketTemplate(context: context),
          child: Container(
            height: 132,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          child: InkWell(
                            onTap: (){
                              if(ticket.valid == true)
                              showDialog(
                                context: context,
                                builder: (_){
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13)
                                    ),
                                      child: Container(
                                        height: 350,
                                        width: MediaQuery.of(context).size.width,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            QrImage(
                                              data: jsonEncode(ticket),
                                              version: QrVersions.auto,
                                              size: 230,
                                              gapless: false,
                                            ),
                                            Text(
                                              "Scan QR Code"
                                            )
                                          ],
                                        ),
                                      )
                                  );
                                }
                              );
                            },
                            child: Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Opacity(
                                  opacity: ticket.valid ? 1 : 0.5,
                                  child: QrImage(
                                    data: 'eticket',
                                    version: QrVersions.auto,
                                    size: 67,
                                    gapless: false,
                                  ),
                                ),
                                if(ticket.valid == false)
                                  Positioned(
                                      top: -9,
                                      left: -5,
                                      child: _renderTicketStatus(ticket.used)
                                  )
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "N0. "+ticket.ticketId,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    )
                ),
                Expanded(
                    flex: 10,
                    child: Stack(
                      children:<Widget>[
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image(
                            image: _ticketCategoryIcon(ticket),
                          ),
                        ),

                        if(ticket is ShowTicket)
                          _renderShowTicket(ticket),

                        if(ticket is VisitTicket)
                          _renderVisitTicket(ticket),

                        if(ticket is PartyTicket)
                          _renderPartyTicket(ticket),

                        if(ticket is TravelTicket)
                          _renderTravelTicket(ticket)

                      ]
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderPartyTicket(PartyTicket ticket){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        onTap: (){ Navigator.of(context).pushNamed( "/ticket-detail", arguments: ticket ); },
        child: Padding(
          padding: const EdgeInsets.fromLTRB (15.0, 8.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      ticket.title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor
                      ),
                    ),
                  ),
                  Container(
                    height: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Theme.of(context).primaryColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:0.0, horizontal: 5.0),
                      child: Center(
                        child: Text(
                          "PRICE : €"+ticket.price,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).accentColor
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "artist : "+ticket.artist.toUpperCase(),
                style: TextStyle(
                    fontSize: 12,
                    color : Theme.of(context).primaryColor
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "date : ",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      ),
                      Text(
                        ticket.date,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "time : ",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      ),
                      Text(
                        ticket.startTime+"/"+ticket.endTime,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Text(
                ticket.address,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderVisitTicket(VisitTicket ticket){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        onTap: (){ Navigator.pushNamed(context, "/ticket-detail", arguments: ticket ); },
        child: Padding(
          padding: const EdgeInsets.fromLTRB (15.0, 8.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      ticket.title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor
                      ),
                    ),
                  ),
                  Container(
                    height: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Theme.of(context).primaryColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:0.0, horizontal: 5.0),
                      child: Center(
                        child: Text(
                          "PRICE : €"+ticket.price,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).accentColor
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "opeaning hour",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      ),
                      Text(
                        ticket.openTime+"/"+ticket.closeTime,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "last entry",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      ),
                      Text(
                        ticket.lastEntry,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Text(
                ticket.address,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderTravelTicket(TravelTicket ticket){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        onTap: (){ Navigator.pushNamed(context, "/ticket-detail", arguments: ticket ); },
        child: Padding(
          padding: const EdgeInsets.fromLTRB (15.0, 8.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          ticket.title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        Text(
                          ticket.transportation,
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Theme.of(context).primaryColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:0.0, horizontal: 5.0),
                      child: Center(
                        child: Text(
                          "PRICE : €"+ticket.price,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).accentColor
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "von : ",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12
                            ),
                          ),
                          Text(
                            ticket.from,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "über : ",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12
                            ),
                          ),
                          Text(
                            ticket.through,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "nach : ",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12
                            ),
                          ),
                          Text(
                            ticket.to,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Preisstufe : ",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12
                            ),
                          ),
                          Text(
                            ".",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 12
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "Gültig am: "+ticket.purchaseDate,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderShowTicket(ShowTicket ticket){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        onTap: (){ Navigator.pushNamed(context, "/ticket-detail", arguments: ticket ); },
        child: Padding(
          padding: const EdgeInsets.fromLTRB (15.0, 8.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      ticket.title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor
                      ),
                    ),
                  ),
                  Container(
                    height: 22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Theme.of(context).primaryColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:0.0, horizontal: 5.0),
                      child: Center(
                        child: Text(
                          "PRICE : €"+ticket.price,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).accentColor
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "show : "+ticket.showTitle.toUpperCase(),
                style: TextStyle(
                    fontSize: 12,
                    color : Theme.of(context).primaryColor
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "theater",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      ),
                      Text(
                        ticket.theater,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "seat",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      ),
                      Text(
                        ticket.row+"/"+ticket.column,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "date : "+ticket.showDate,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      ),
                      Text(
                        "time : "+ticket.showTime,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 12
                        ),
                      )
                    ],
                  )
                ],
              ),
              Text(
                ticket.hallAddress,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderTicketStatus(bool used){
    if(used){
      return Image(
        height: 60,
        image: AssetImage("assets/images/used.png"),
      );
    }else{
      return Image(
        height: 60,
        image: AssetImage("assets/images/expired.png"),
      );
    }
  }

  Widget _drawerNavigation(context){
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 268,
            child: DrawerHeader(
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 128,
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
              child: Icon(
                Icons.home,
                size: 20,
                color: Theme.of(context).accentColor,
              ),
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).accentColor
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
              child: Icon(
                FlutterIcon.ticket,
                size: 20,
                color: Theme.of(context).accentColor,
              ),
            ),
            title: Text(
              'Buy Tickets',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).accentColor
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
              child: Icon(
                Icons.info_outline,
                size: 20,
                color: Theme.of(context).accentColor,
              ),
            ),
            title: Text(
              'About Us',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).accentColor
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
              child: Icon(
                Icons.settings,
                size: 20,
                color: Theme.of(context).accentColor,
              ),
            ),
            title: Text(
              'Setting',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).accentColor
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
              child: Icon(
                FlutterIcon.logout_1,
                size: 20,
                color: Theme.of(context).accentColor,
              ),
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).accentColor
              ),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}

class TicketTemplate extends CustomPainter{
  BuildContext context;
  TicketTemplate({this.context});
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final double height = size.height;
    Paint paint = Paint();

    Path ticketPath = Path();
    ticketPath.moveTo(0, 10);
    ticketPath.quadraticBezierTo(0, 0, 10, 0);
    ticketPath.lineTo(width*0.272, 0);
    ticketPath.cubicTo(width*0.277, 10.5, width*0.305, 10.5, width*0.31, 0);
    ticketPath.lineTo(width-10, 0);
    ticketPath.quadraticBezierTo(width, 0, width, 10);
    ticketPath.lineTo(width, height-10);
    ticketPath.quadraticBezierTo(width, height, width-10, height);
    ticketPath.lineTo(width*0.31, height);
    ticketPath.cubicTo(width*0.305, height-10.5, width*0.277, height-10.5, width*0.272, height);
    ticketPath.lineTo(10, height);
    ticketPath.quadraticBezierTo(0, height, 0, height-10);

    ticketPath.moveTo(width*0.29, 17);
    ticketPath.cubicTo(width*0.279, 19, width*0.279, 26, width*0.29, 28);
    ticketPath.cubicTo(width*0.303, 26, width*0.303, 19, width*0.29, 17);

    ticketPath.moveTo(width*0.29, 35);
    ticketPath.cubicTo(width*0.279, 37, width*0.279, 44, width*0.29, 46);
    ticketPath.cubicTo(width*0.303, 44, width*0.303, 37, width*0.29, 35);

    ticketPath.moveTo(width*0.29, 53);
    ticketPath.cubicTo(width*0.279, 55, width*0.279, 62, width*0.29, 64);
    ticketPath.cubicTo(width*0.303, 62, width*0.303, 55, width*0.29, 53);

    ticketPath.moveTo(width*0.29, 71);
    ticketPath.cubicTo(width*0.279, 73, width*0.279, 80, width*0.29, 82);
    ticketPath.cubicTo(width*0.303, 80, width*0.303, 73, width*0.29, 71);

    ticketPath.moveTo(width*0.29, 89);
    ticketPath.cubicTo(width*0.279, 91, width*0.279, 98, width*0.29, 100);
    ticketPath.cubicTo(width*0.303, 98, width*0.303, 91, width*0.29, 89);

    ticketPath.moveTo(width*0.29, 107);
    ticketPath.cubicTo(width*0.279, 109, width*0.279, 116, width*0.29, 118);
    ticketPath.cubicTo(width*0.303, 116, width*0.303, 109, width*0.29, 107);

    paint.color = Colors.white;
    canvas.drawPath(ticketPath, paint);

    Path ticketDetailPath = Path();
    ticketDetailPath.moveTo(width*0.29, 7.7);

    ticketDetailPath.cubicTo(width*0.297, 8, width*0.306, 6, width*0.31, 0);
    ticketDetailPath.lineTo(width-10, 0);
    ticketDetailPath.quadraticBezierTo(width, 0, width, 10);
    ticketDetailPath.lineTo(width, height-10);
    ticketDetailPath.quadraticBezierTo(width, height, width-10, height);
    ticketDetailPath.lineTo(width*0.31, height);
    ticketDetailPath.cubicTo(width*0.306, height-6, width*0.297, height-8, width*0.29, height-7.7);

    ticketDetailPath.lineTo(width*0.29, 118);
    ticketDetailPath.cubicTo(width*0.303, 116, width*0.303, 109, width*0.29, 107);

    ticketDetailPath.lineTo(width*0.29, 100);
    ticketDetailPath.cubicTo(width*0.303, 98, width*0.303, 91, width*0.29, 89);

    ticketDetailPath.lineTo(width*0.29, 82);
    ticketDetailPath.cubicTo(width*0.303, 80, width*0.303, 73, width*0.29, 71);

    ticketDetailPath.lineTo(width*0.29, 64);
    ticketDetailPath.cubicTo(width*0.303, 62, width*0.303, 55, width*0.29, 53);

    ticketDetailPath.lineTo(width*0.29, 46);
    ticketDetailPath.cubicTo(width*0.303, 44, width*0.303, 37, width*0.29, 35);

    ticketDetailPath.lineTo(width*0.29, 28);
    ticketDetailPath.cubicTo(width*0.303, 26, width*0.303, 19, width*0.29, 17);

    paint.color = Theme.of(context).accentColor;

    canvas.drawPath(ticketDetailPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}


