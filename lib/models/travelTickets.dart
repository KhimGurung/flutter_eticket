import 'package:fluttereticket/models/tickets.dart';

class TravelTicket{
  String ticketId;
  String ticketType;
  String transportation;
  String from;
  String to;
  String through;
  String purchaseDate;
  String price;
  bool valid;
  bool used;

  TravelTicket({
    this.ticketId,
    this.ticketType,
    this.transportation,
    this.from,
    this.to,
    this.through,
    this.purchaseDate,
    this.price,
    this.valid,
    this.used
  });
}