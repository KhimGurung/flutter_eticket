import 'package:flutter/material.dart';
import 'package:fluttereticket/models/show_tickets.dart';
import 'package:fluttereticket/screens/ticket_detail/widgets/ticket_price_widget.dart';

class ShowTicketTemplate extends StatelessWidget {

  final ShowTicket ticket;

  const ShowTicketTemplate({this.ticket});

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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 30.0),
                    child: Text(
                      ticket.showTitle.toUpperCase(),
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
                          ticket.theater,
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
                          ticket.row+"/"+ticket.column,
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
                              ticket.showDate,
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
                              ticket.showTime,
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
                  ticket.hallAddress,
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
}
