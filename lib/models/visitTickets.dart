import 'package:fluttereticket/models/tickets.dart';

class VisitTicket{
  String ticketId;
  String siteName;
  String address;
  String openTime;
  String closeTime;
  String lastEntry;
  String price;
  bool valid;
  bool used;

  VisitTicket({
    this.ticketId,
    this.siteName,
    this.address,
    this.openTime,
    this.closeTime,
    this.lastEntry,
    this.price,
    this.valid,
    this.used
  });
}