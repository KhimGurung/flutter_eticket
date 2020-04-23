import 'package:flutter/material.dart';
import 'package:fluttereticket/models/travel_tickets.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/ticket_price_widget.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/ticket_widget.dart';

class TravelTicketTemplate extends StatelessWidget {
  final TravelTicket ticket;
  const TravelTicketTemplate({this.ticket});
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
                  TicketPrice(price: ticket.price),
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
}
