import 'package:flutter/material.dart';
import 'package:fluttereticket/models/travel_tickets.dart';

class Header extends StatelessWidget {

  final dynamic ticket;

  const Header({this.ticket});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 13,
        ),
        Container(
          height: 83,
          width: 83,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/"+ticket.logo)
              )
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                ticket.title,
                style: TextStyle(
                  height: 1,
                  color: Theme.of(context).primaryColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 3.0,
                      color: Colors.black38,
                    ),
                  ],
                ),
              ),
              if(ticket is TravelTicket)
                Text(
                  ticket.transportation,
                  style: TextStyle(
                    height: 1,
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.0, 1.0),
                        blurRadius: 3.0,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
