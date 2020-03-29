import 'package:fluttereticket/models/tickets.dart';

class ShowTicket{
  String ticketId;
  String hallName;
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
    this.ticketId,
    this.hallName,
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
}