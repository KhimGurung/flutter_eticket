import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluttereticket/widgets/ticket_status_widget.dart';

class QRCode extends StatelessWidget {

  final dynamic ticket;

  const QRCode({this.ticket});

  @override
  Widget build(BuildContext context) {
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
                    opacity: ticket.valid?1:0.5,
                    child: QrImage(
                      data: jsonEncode(ticket),
                      version: QrVersions.auto,
                      size: 230,
                      gapless: false,
                    ),
                  ),
                  if(ticket.valid == false)
                    Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                            child: TicketStatus(ticket.used, 150)
                        )
                    ),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                "NO: "+ticket?.ticketId,
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
}
