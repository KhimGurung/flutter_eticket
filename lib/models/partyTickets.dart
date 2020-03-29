import 'package:fluttereticket/models/tickets.dart';

class PartyTicket{
  String ticketId;
  String title;
  String address;
  String artist;
  String date;
  String startTime;
  String endTime;
  String price;
  bool valid;
  bool used;

  PartyTicket({
    this.ticketId,
    this.title,
    this.address,
    this.artist,
    this.date,
    this.startTime,
    this.endTime,
    this.price,
    this.valid,
    this.used
  });
}
