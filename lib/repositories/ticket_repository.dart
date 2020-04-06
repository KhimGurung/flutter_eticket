
import 'package:fluttereticket/models/tickets.dart';
import 'package:fluttereticket/services/api_service.dart';

class TicketRepository{
  APIService apiService = APIService();

  Future<dynamic> fetchAllTicket() async {
    return tickets;
  }

  Future<dynamic> fetchValidTicket() async {
    List<dynamic> validTicket = tickets.where((ticket) => ticket.valid == true ).toList();
    return validTicket;
  }

  Future<dynamic> fetchExpiredTicket() async {
    List<dynamic> expiredTicket = tickets.where((ticket) => ticket.valid == false ).toList();
    return expiredTicket;
  }
}