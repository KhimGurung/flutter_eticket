import 'package:fluttereticket/models/tickets.dart';

class ShowTicket{
  String logo;
  String ticketId;
  String purchaseDate;
  String title;
  String hallAddress;
  String showTitle;
  String theater;
  String row;
  String column;
  String showDate;
  String showTime;
  String price;
  bool valid;
  bool used;

  ShowTicket({
    this.logo,
    this.ticketId,
    this.purchaseDate,
    this.title,
    this.hallAddress,
    this.showTitle,
    this.theater,
    this.row,
    this.column,
    this.showDate,
    this.showTime,
    this.price,
    this.valid,
    this.used
  });

  Map<String, dynamic> toJson() => {
    'logo' : logo,
    'ticketId' : ticketId,
    'purchaseDate' : purchaseDate,
    'title' : title,
    'hallAddress' : hallAddress,
    'showTitle' : showTitle,
    'theater' : theater,
    'row' : row,
    'column' : column,
    'showDate' : showDate,
    'showTime' : showTime,
    'price' : price,
    'valid' : valid,
    'used' : used,
  };
}