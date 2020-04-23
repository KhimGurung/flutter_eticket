import 'package:flutter/material.dart';
import 'package:fluttereticket/models/visit_tickets.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/ticket_price_widget.dart';

class VisitTicketTemplate extends StatelessWidget {
  final VisitTicket ticket;
  const VisitTicketTemplate({this.ticket});
  @override
  Widget build(BuildContext context) {
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
                  TicketPrice(price: ticket.price),
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
}
