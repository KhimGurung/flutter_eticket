import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttereticket/models/partyTickets.dart';
import 'package:fluttereticket/models/travelTickets.dart';
import 'package:fluttereticket/models/visitTickets.dart';
import 'package:fluttereticket/models/showTickets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketDetailScreen extends StatefulWidget {

  final dynamic ticket;

  TicketDetailScreen({this.ticket,});

  @override
  _TicketDetailScreenState createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: _body(),
    );
  }

  Widget _body(){
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
                "Ticket Detail",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0,),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 10,),
                  Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 70,
                          ),
                          _qrCode(),
                          Container(
                            transform: Matrix4.translationValues(0.0, -6.0, 0.0),
                            margin: const EdgeInsets.symmetric(vertical:0.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 5,
                                    offset: Offset(0, 7)
                                  )
                                ]
                            ),
                            child: CustomPaint(
                              painter: TicketDivider(context: context),
                              child: Container(
                                height: 32,
                              ),
                            ),
                          ),
                          if(widget.ticket is VisitTicket)
                            _renderVisitTicket(),
                          if(widget.ticket is ShowTicket)
                            _renderShowTicket(),
                          if(widget.ticket is PartyTicket)
                            _renderPartyTicket(),
                          if(widget.ticket is TravelTicket)
                            _renderTravelTicket(),
                          SizedBox(height: 10,),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical:0.0, horizontal: 16.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 13,
                            ),
                            Container(
                              height: 83,
                              width: 83,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/images/"+widget.ticket.logo)
                                  )
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.ticket.title,
                                    style: TextStyle(
                                      height: 1,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 3.0,
                                          color: Colors.black38,
                                        ),
                                      ],
                                    ),
                                  ),
                                  if(widget.ticket is TravelTicket)
                                    Text(
                                    widget.ticket.transportation,
                                    style: TextStyle(
                                      height: 1,
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(0.0, 1.0),
                                          blurRadius: 3.0,
                                          color: Colors.black38,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _qrCode(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
            )
          ]
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 50.0),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Opacity(
                    opacity: widget.ticket.valid?1:0.5,
                    child: QrImage(
                      data: jsonEncode(widget.ticket),
                      version: QrVersions.auto,
                      size: 230,
                      gapless: false,
                    ),
                  ),
                  if(widget.ticket.valid == false)
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                            child: _renderTicketStatus(widget.ticket.used)
                        )
                    ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                "NO: "+widget.ticket?.ticketId,
                style: TextStyle(
                    fontSize: 17.0,
                    color: Theme.of(context).accentColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderVisitTicket(){
    return Container(
      transform: Matrix4.translationValues(0.0, -12.0, 0.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(0, 7)
            )
          ]
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/visit.png',
              height: 155,
              fit:  BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "PURCHASE NO",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        Text(
                          widget.ticket.purchaseDate,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 0.0),
                          child: Text(
                            "TICKET PRICE : €"+widget.ticket.price,
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).accentColor
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  "VALIDITY",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                Text(
                  widget.ticket.validity,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "OPENING HOUR",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        Text(
                          widget.ticket.openTime+" - "+widget.ticket.closeTime,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "LAST ENTRY",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        Text(
                          widget.ticket.lastEntry,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  "ADDRESS",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                Text(
                  widget.ticket.address,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 22.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          height: 31,
                          image: AssetImage("assets/images/camera.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          height: 31,
                          image: AssetImage("assets/images/snacks.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          height: 31,
                          image: AssetImage("assets/images/camera.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Note: This ticket is non-refundable and non-transfarrable",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0, horizontal: 0.0),
                  child: Text(
                    "Terms and condition of this ticket are available in the website or from any ticket information desk:",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                Text(
                  "Got to website",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF16C9CF)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderShowTicket(){
    return Container(
      transform: Matrix4.translationValues(0.0, -12.0, 0.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(0, 7)
            )
          ]
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/show.png',
              height: 155,
              fit:  BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "PURCHASE NO",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        Text(
                          widget.ticket.purchaseDate,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 0.0),
                          child: Text(
                            "TICKET PRICE : €"+widget.ticket.price,
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).accentColor
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
                    child: Text(
                      widget.ticket.showTitle.toUpperCase(),
                      style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "THEATER",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        Text(
                          widget.ticket.theater,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "SEAT",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        Text(
                         widget.ticket.row+"/"+widget.ticket.column,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "DATE : ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                            Text(
                              widget.ticket.showDate,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "TIME : ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                            Text(
                              widget.ticket.showTime,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  "ADDRESS",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                Text(
                  widget.ticket.hallAddress,
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 22.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          height: 31,
                          image: AssetImage("assets/images/camera.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          height: 31,
                          image: AssetImage("assets/images/snacks.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          height: 31,
                          image: AssetImage("assets/images/camera.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Note: This ticket is non-refundable and non-transfarrable",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0, horizontal: 0.0),
                  child: Text(
                    "Terms and condition of this ticket are available in the website or from any ticket information desk:",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                Text(
                  "Got to website",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF16C9CF)
                  ),
                ),
              ],
            ),
        )],
      ),
    );
  }

  Widget _renderPartyTicket(){
    return Container(
      transform: Matrix4.translationValues(0.0, -12.0, 0.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(0, 7)
            )
          ]
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/party.png',
              height: 130,
              fit:  BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "PURCHASE NO",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        Text(
                          widget.ticket.purchaseDate,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 0.0),
                          child: Text(
                            "TICKET PRICE : €"+widget.ticket.price,
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).accentColor
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
                      child: Text(
                       widget.ticket.artist.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "DATE : "+widget.ticket.date,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        SizedBox(width: 30,),
                        Text(
                          "TIME : " +widget.ticket.startTime+" - "+widget.ticket.endTime,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(
                     widget.ticket.address,
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              height: 31,
                              image: AssetImage("assets/images/camera.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              height: 31,
                              image: AssetImage("assets/images/snacks.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              height: 31,
                              image: AssetImage("assets/images/camera.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "Note: This ticket is non-refundable and non-transfarrable",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0, horizontal: 0.0),
                  child: Text(
                    "Terms and condition of this ticket are available in the website or from any ticket information desk:",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                Text(
                  "Got to website",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF16C9CF)
                  ),
                ),
              ],
            ),
          )],
      ),
    );
  }

  Widget _renderTravelTicket(){
    return Container(
      transform: Matrix4.translationValues(0.0, -12.0, 0.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(0, 7)
            )
          ]
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/travel.png',
              height: 70,
              fit:  BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "PURCHASE NO",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                        Text(
                          widget.ticket.purchaseDate,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 0.0),
                          child: Text(
                            "TICKET PRICE : €"+widget.ticket.price,
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).accentColor
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "FROM : ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).primaryColor
                                ),
                              ),
                              Text(
                                widget.ticket.from,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "THROUGH : ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).primaryColor
                                ),
                              ),
                              Text(
                                widget.ticket.through,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "NACH : ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).primaryColor
                                ),
                              ),
                              Text(
                                widget.ticket.to,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "PRICE-LEVEL : ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context).primaryColor
                                ),
                              ),
                              Text(
                                ".",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "Note: This ticket is non-refundable and non-transfarrable",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).primaryColor
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:5.0, horizontal: 0.0),
                  child: Text(
                    "Terms and condition of this ticket are available in the website or from any ticket information desk:",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).primaryColor
                    ),
                  ),
                ),
                Text(
                  "Got to website",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF16C9CF)
                  ),
                ),
              ],
            ),
          )],
      ),
    );
  }

  Widget _renderTicketStatus(bool used){
    if(used){
      return Image(
        height: 150,
        image: AssetImage("assets/images/used.png"),
      );
    }else{
      return Image(
        height: 150,
        image: AssetImage("assets/images/expired.png"),
      );
    }
  }
}

class TicketDivider extends CustomPainter{
  BuildContext context;
  TicketDivider({this.context});
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final double height = size.height;
    Paint paint = Paint();

    Path firstHalf = Path();
    firstHalf.moveTo(0, 0);
    firstHalf.lineTo(width, 0);
    firstHalf.lineTo(width, 6);
    firstHalf.quadraticBezierTo(width-9, 7, width-10, height/2);

    firstHalf.lineTo( width*0.92, height/2);
    firstHalf.cubicTo(width*0.92, height/2-5, width*0.88, height/2-5, width*0.88, height/2);

    firstHalf.lineTo( width*0.84, height/2);
    firstHalf.cubicTo(width*0.84, height/2-5, width*0.80, height/2-5, width*0.80, height/2);

    firstHalf.lineTo( width*0.76, height/2);
    firstHalf.cubicTo(width*0.76, height/2-5, width*0.72, height/2-5, width*0.72, height/2);

    firstHalf.lineTo( width*0.68, height/2);
    firstHalf.cubicTo(width*0.68, height/2-5, width*0.64, height/2-5, width*0.64, height/2);

    firstHalf.lineTo( width*0.60, height/2);
    firstHalf.cubicTo(width*0.60, height/2-5, width*0.56, height/2-5, width*0.56, height/2);

    firstHalf.lineTo( width*0.52, height/2);
    firstHalf.cubicTo(width*0.52, height/2-5, width*0.48, height/2-5, width*0.48, height/2);

    firstHalf.lineTo( width*0.44, height/2);
    firstHalf.cubicTo(width*0.44, height/2-5, width*0.40, height/2-5, width*0.40, height/2);

    firstHalf.lineTo( width*0.36, height/2);
    firstHalf.cubicTo(width*0.36, height/2-5, width*0.32, height/2-5, width*0.32, height/2);

    firstHalf.lineTo( width*0.28, height/2);
    firstHalf.cubicTo(width*0.28, height/2-5, width*0.24, height/2-5, width*0.24, height/2);

    firstHalf.lineTo( width*0.20, height/2);
    firstHalf.cubicTo(width*0.20, height/2-5, width*0.16, height/2-5, width*0.16, height/2);

    firstHalf.lineTo( width*0.12, height/2);
    firstHalf.cubicTo(width*0.12, height/2-5, width*0.08, height/2-5, width*0.08, height/2);

    firstHalf.lineTo(10, height/2);
    firstHalf.quadraticBezierTo(9, 7, 0, 6);

    paint.color = Theme.of(context).primaryColor;
    canvas.drawPath(firstHalf, paint);

    Path secondHalf = Path();
    secondHalf.moveTo(0, height);
    secondHalf.lineTo(width, height);
    secondHalf.lineTo(width, height-6);
    secondHalf.quadraticBezierTo(width-9, height-7, width-10, height/2);

    secondHalf.lineTo( width*0.92, height/2);
    secondHalf.cubicTo(width*0.92, height/2+5, width*0.88, height/2+5, width*0.88, height/2);

    secondHalf.lineTo( width*0.84, height/2);
    secondHalf.cubicTo(width*0.84, height/2+5, width*0.80, height/2+5, width*0.80, height/2);

    secondHalf.lineTo( width*0.76, height/2);
    secondHalf.cubicTo(width*0.76, height/2+5, width*0.72, height/2+5, width*0.72, height/2);

    secondHalf.lineTo( width*0.68, height/2);
    secondHalf.cubicTo(width*0.68, height/2+5, width*0.64, height/2+5, width*0.64, height/2);

    secondHalf.lineTo( width*0.60, height/2);
    secondHalf.cubicTo(width*0.60, height/2+5, width*0.56, height/2+5, width*0.56, height/2);

    secondHalf.lineTo( width*0.52, height/2);
    secondHalf.cubicTo(width*0.52, height/2+5, width*0.48, height/2+5, width*0.48, height/2);

    secondHalf.lineTo( width*0.44, height/2);
    secondHalf.cubicTo(width*0.44, height/2+5, width*0.40, height/2+5, width*0.40, height/2);

    secondHalf.lineTo( width*0.36, height/2);
    secondHalf.cubicTo(width*0.36, height/2+5, width*0.32, height/2+5, width*0.32, height/2);

    secondHalf.lineTo( width*0.28, height/2);
    secondHalf.cubicTo(width*0.28, height/2+5, width*0.24, height/2+5, width*0.24, height/2);

    secondHalf.lineTo( width*0.20, height/2);
    secondHalf.cubicTo(width*0.20, height/2+5, width*0.16, height/2+5, width*0.16, height/2);

    secondHalf.lineTo( width*0.12, height/2);
    secondHalf.cubicTo(width*0.12, height/2+5, width*0.08, height/2+5, width*0.08, height/2);

    secondHalf.lineTo(10, height/2);
    secondHalf.quadraticBezierTo(9, height-7, 0, height-6);

    paint.color = Theme.of(context).accentColor;
    canvas.drawPath(secondHalf, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
