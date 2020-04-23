import 'package:flutter/material.dart';
import 'package:fluttereticket/models/show_tickets.dart';
import 'package:fluttereticket/screens/ticket_list/widgets/ticket_price_widget.dart';

class ShowTicketTemplate extends StatelessWidget {
  final ShowTicket ticket;
  const ShowTicketTemplate({this.ticket});
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
}
