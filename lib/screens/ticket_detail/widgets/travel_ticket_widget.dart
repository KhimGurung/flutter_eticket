import 'package:flutter/material.dart';
import 'package:fluttereticket/models/travel_tickets.dart';
import 'package:fluttereticket/screens/ticket_detail/widgets/ticket_price_widget.dart';

class TravelTicketTemplate extends StatelessWidget {

  final TravelTicket ticket;

  const TravelTicketTemplate({this.ticket});

  @override
  Widget build(BuildContext context) {
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
                          ticket.purchaseDate,
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor
                          ),
                        ),
                      ],
                    ),
                    TicketPrice(
                      price: ticket.price,
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
                                ticket.from,
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
                                ticket.through,
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
                                ticket.to,
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
}
