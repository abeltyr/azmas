import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TicketProvider with ChangeNotifier {
  Future<void> insertEvents() async {
    await database.groupsDao.insertGroup(Group(
      id: "2",
      category: "GetTogether",
      title: "Azmas",
      description: "Lorem  PageMaker including versions of Lorem Ipsum.",
      avatar:
          "https://images.unsplash.com/photo-1547634678-181c1103b6ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60",
      background:
          "https://images.unsplash.com/photo-1547532182-bf296f6be875?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1600&q=80",
      colorTheme: "As",
      members: 0,
      public: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ));
  }

  Stream<List<Ticket>> watchUsed() {
    return database.ticketsDao.watchTickets(true);
  }

  Stream<List<Ticket>> watchUnused() {
    return database.ticketsDao.watchTickets(false);
  }
}
