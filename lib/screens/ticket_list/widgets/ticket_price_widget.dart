import 'package:flutter/material.dart';

class TicketPrice extends StatelessWidget {
  final String price;
  const TicketPrice({this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Theme.of(context).primaryColor
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:0.0, horizontal: 5.0),
        child: Center(
          child: Text(
            "PRICE : €"+price,
            style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).accentColor
            ),
          ),
        ),
      ),
    );
  }
}
