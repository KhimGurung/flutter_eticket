import 'package:flutter/material.dart';
import 'package:fluttereticket/models/party_tickets.dart';
import 'package:fluttereticket/models/show_tickets.dart';
import 'package:fluttereticket/models/travel_tickets.dart';
import 'package:fluttereticket/models/visit_tickets.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/party_ticket_widget.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/qrcode_widget.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/show_ticket_widget.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/travel_ticket_widget.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/visit_ticket_widget.dart';

class Ticket extends StatelessWidget {

  final dynamic ticket;

  const Ticket({this.ticket});

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


  @override
  Widget build(BuildContext context) {
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
                  child: QRCodeSection(ticket:ticket),
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
                          ShowTicketTemplate(ticket: ticket),

                        if(ticket is VisitTicket)
                          VisitTicketTemplate(ticket: ticket),

                        if(ticket is PartyTicket)
                          PartyTicketTemplate(ticket: ticket),

                        if(ticket is TravelTicket)
                          TravelTicketTemplate(ticket: ticket)

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
