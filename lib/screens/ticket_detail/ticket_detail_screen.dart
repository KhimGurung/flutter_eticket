
import 'package:flutter/material.dart';
import 'package:fluttereticket/models/party_tickets.dart';
import 'package:fluttereticket/models/travel_tickets.dart';
import 'package:fluttereticket/models/visit_tickets.dart';
import 'package:fluttereticket/models/show_tickets.dart';
import 'package:fluttereticket/screens/ticket_detail/widgets/header_widget.dart';
import 'package:fluttereticket/screens/ticket_detail/widgets/party_ticket_widget.dart';
import 'package:fluttereticket/screens/ticket_detail/widgets/show_ticket_widget.dart';
import 'package:fluttereticket/screens/ticket_detail/widgets/travel_ticket_widget.dart';
import 'package:fluttereticket/screens/ticket_detail/widgets/qrcode_widget.dart';
import 'package:fluttereticket/screens/ticket_detail/widgets/visit_ticket_widget.dart';
import 'package:fluttereticket/widgets/screen_title_widget.dart';

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
                child: ScreenTitle("Ticket Detail"),
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
                            QRCode(ticket: widget.ticket),
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
                              VisitTicketTemplate(ticket: widget.ticket),
                            if(widget.ticket is ShowTicket)
                              ShowTicketTemplate(ticket: widget.ticket),
                            if(widget.ticket is PartyTicket)
                              PartyTicketTemplate(ticket: widget.ticket),
                            if(widget.ticket is TravelTicket)
                              TravelTicketTemplate(ticket: widget.ticket),
                            SizedBox(height: 10,),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:0.0, horizontal: 16.0),
                          child: Header(ticket: widget.ticket,),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
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
