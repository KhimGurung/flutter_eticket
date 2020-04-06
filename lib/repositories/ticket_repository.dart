
import 'package:fluttereticket/models/tickets.dart';
import 'package:fluttereticket/services/api_service.dart';

class TicketRepository{
  APIService apiService = APIService();

  Future<dynamic> fetchAllTicket() async {
    print(tickets.length);
    return tickets;
  }

  Future<dynamic> fetchValidTicket() async {
    List<dynamic> validTicket = tickets.where((ticket) => ticket.valid == true ).toList();
    print(validTicket.length);
    return validTicket;
  }

  Future<dynamic> fetchExpiredTicket() async {
    List<dynamic> expiredTicket = tickets.where((ticket) => ticket.valid == false ).toList();
    print(expiredTicket.length);
    return expiredTicket;
  }
}