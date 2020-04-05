import 'package:flutter/material.dart';

class TicketStatus extends StatelessWidget {

  final bool used;
  final double height;

  const TicketStatus(this.used, this.height);

  @override
  Widget build(BuildContext context) {
    if(used){
      return Image(
        height: height,
        image: AssetImage("assets/images/used.png"),
      );
    }else{
      return Image(
        height: height,
        image: AssetImage("assets/images/expired.png"),
      );
    }
  }
}
