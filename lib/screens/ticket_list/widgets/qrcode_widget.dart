import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttereticket/widgets/ticket_status_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeSection extends StatelessWidget {
  final dynamic ticket;
  const QRCodeSection({this.ticket});
  @override
  Widget build(BuildContext context) {
    return Column(
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
                      child: TicketStatus(ticket.used, 60)
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
    );
  }
}
