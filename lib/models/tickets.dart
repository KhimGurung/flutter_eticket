import 'package:fluttereticket/models/showTickets.dart';
import 'package:fluttereticket/models/partyTickets.dart';
import 'package:fluttereticket/models/visitTickets.dart';
import 'package:fluttereticket/models/travelTickets.dart';

List<dynamic> tickets = [
  ShowTicket(
      ticketId: "29865743",
      hallName: "Internatinal Cineplex",
      hallAddress: "Am Olympiapark 2, 80809 Müchen",
      showTitle: "Lord of the Rings",
      theater: "01",
      row: "07",
      column: "12",
      showDate: "12.04.2019",
      showTime: "19:00",
      price: "19",
      valid: true,
      used: false
  ),
  PartyTicket(
      ticketId: "29865743",
      title: "New Year Party",
      address: "Zeil 9, 9058 Frankfurt",
      artist: "The Amazing Spiderman",
      startTime: "07:00",
      endTime: "12:00",
      date: "12.04.2019",
      price: "13",
      valid: true,
      used: false
  ),
  ShowTicket(
      ticketId: "29865743",
      hallName: "Internatinal Cineplex",
      hallAddress: "Am Olympiapark 2, 80809 Müchen",
      showTitle: "Lord of the Rings",
      theater: "01",
      row: "07",
      column: "12",
      showDate: "12.04.2019",
      showTime: "19:00",
      price: "15",
      valid: true,
      used: false
  ),
  TravelTicket(
      ticketId: "29865743",
      ticketType: "Day Ticket",
      transportation: "RMV Bus",
      from: "5000",
      to: "5000",
      through: "0000",
      purchaseDate: "12.11.2019",
      price: "12",
      valid: false,
      used: true
  ),
  VisitTicket(
      ticketId: "29865743",
      siteName: "BMW Museum",
      address: "Am Olympiapark 2, 80809 Müchen",
      openTime: "09:00",
      closeTime: "19:00",
      lastEntry: "18:00",
      price: "5",
      valid: false,
      used: true
  ),
  PartyTicket(
      ticketId: "29865743",
      title: "New Year Party",
      address: "Zeil 9, 9058 Frankfurt",
      artist: "The Amazing Spiderman",
      startTime: "07:00",
      endTime: "12:00",
      date: "12.04.2019",
      price: "13",
      valid: false,
      used: false
  ),
  VisitTicket(
      ticketId: "29865743",
      siteName: "Frankfurt Tower",
      address: "Am Olympiapark 2, 80809 Müchen",
      openTime: "09:00",
      closeTime: "19:00",
      lastEntry: "18:00",
      price: "5",
      valid: false,
      used: false
  ),
  ShowTicket(
      ticketId: "29865743",
      hallName: "Internatinal Cineplex",
      hallAddress: "Am Olympiapark 2, 80809 Müchen",
      showTitle: "Lord of the Rings",
      theater: "01",
      row: "07",
      column: "12",
      showDate: "12.04.2019",
      showTime: "19:00",
      price: "19",
      valid: true,
      used: false
  ),
];
