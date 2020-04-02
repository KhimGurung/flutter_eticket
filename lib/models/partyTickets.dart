import 'package:fluttereticket/models/tickets.dart';

class PartyTicket{
  String ticketId;
  String purchaseDate;
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
    this.purchaseDate,
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

  Map<String, dynamic> toJson() => {
    'ticketId' : ticketId,
    'purchaseDate' : purchaseDate,
    'title' : title,
    'address' : address,
    'artist' : artist,
    'date' : date,
    'startTime' : startTime,
    'endTime' : endTime,
    'price' : price,
    'valid' : valid,
    'used' : used,
  };
}
