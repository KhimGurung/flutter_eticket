import 'package:fluttereticket/models/tickets.dart';

class TravelTicket{
  String ticketId;
  String title;
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
    this.title,
    this.transportation,
    this.from,
    this.to,
    this.through,
    this.purchaseDate,
    this.price,
    this.valid,
    this.used
  });

  Map<String, dynamic> toJson() => {
    'ticketId' : ticketId,
    'title' : title,
    'transportation' : transportation,
    'from' : from,
    'to' : to,
    'through' : through,
    'purchaseDate' : purchaseDate,
    'price' : price,
    'valid' : valid,
    'used' : used,
  };
}