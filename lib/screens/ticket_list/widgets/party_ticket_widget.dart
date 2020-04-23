import 'package:flutter/material.dart';
import 'package:fluttereticket/models/party_tickets.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/ticket_price_widget.dart';

class PartyTicketTemplate extends StatelessWidget {
  final PartyTicket ticket;
  const PartyTicketTemplate({this.ticket});
  @override
  Widget build(BuildContext context) {
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
                  TicketPrice(price: ticket.price),
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
}
