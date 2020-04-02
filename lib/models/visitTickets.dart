import 'package:fluttereticket/models/tickets.dart';

class VisitTicket{
  String logo;
  String ticketId;
  String purchaseDate;
  String title;
  String address;
  String openTime;
  String closeTime;
  String lastEntry;
  String price;
  String validity;
  bool valid;
  bool used;

  VisitTicket({
    this.logo,
    this.ticketId,
    this.purchaseDate,
    this.title,
    this.address,
    this.openTime,
    this.closeTime,
    this.lastEntry,
    this.price,
    this.validity,
    this.valid,
    this.used
  });

  Map<String, dynamic> toJson() => {
    'logo' : logo,
    'ticketId' : ticketId,
    'purchaseDate' : purchaseDate,
    'title' : title,
    'address' : address,
    'openTime' : openTime,
    'closeTime' : closeTime,
    'lastEntry' : lastEntry,
    'price' : price,
    'validity' : validity,
    'valid' : valid,
    'used' : used,
  };
}