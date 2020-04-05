import 'package:flutter/material.dart';

class TicketPrice extends StatelessWidget {

  final String price;

  const TicketPrice({this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(3)
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 0.0),
          child: Text(
            "TICKET PRICE : €"+price,
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).accentColor
            ),
          ),
        ),
      ),
    );
  }
}
