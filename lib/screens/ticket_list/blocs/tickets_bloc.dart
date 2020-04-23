import 'dart:async';
import 'dart:collection';

import 'package:fluttereticket/repositories/ticket_repository.dart';
import 'package:rxdart/rxdart.dart';

enum TicketFilterEvent{
  valid,
  expired,
  all
}

class TicketBloc{
  TicketRepository ticketRepository;

  Sink<TicketFilterEvent> get ticketFilterSink => ticketFilterController.sink;
  final ticketFilterController = StreamController<TicketFilterEvent>();

  Stream<UnmodifiableListView<dynamic>> get ticketListStream => ticketListController.stream;
  final ticketListController = BehaviorSubject<UnmodifiableListView<dynamic>>();
  
  TicketBloc(){

    ticketRepository = TicketRepository();

    filterTicket(TicketFilterEvent.valid);

    ticketFilterController.stream.listen(filterTicket);

  }

  void filterTicket(TicketFilterEvent event){
    if(event == TicketFilterEvent.valid){
      ticketRepository.fetchValidTicket().then((validTickets){
        ticketListController.add(UnmodifiableListView(validTickets));
      });
    }else if(event == TicketFilterEvent.expired){
      ticketRepository.fetchExpiredTicket().then((expiredTickets){
        ticketListController.add((UnmodifiableListView(expiredTickets)));
      });
    }else if(event == TicketFilterEvent.all){
      ticketRepository.fetchAllTicket().then((allTickets){
        ticketListController.add(UnmodifiableListView(allTickets));
      });
    }
  }

  void dispose(){
    ticketListController.close();
    ticketFilterController.close();
  }

}