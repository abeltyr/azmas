import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Model/Group/index.dart';
import 'package:azmas/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
  List<EventModel> _events = [];
  List<EventModel> get events {
    return _events;
  }

  Future<List<EventModel>?> getEvents() async {
    _events = [];
    return _events;
  }

  Future<void> insertEvents() async {
    await database.groupsDao.insertGroup(Group(
      id: "2",
      category: "GetTogether",
      title: "Azmas",
      description: "Lorem  PageMaker including versions of Lorem Ipsum.",
      avatar:
          "https://images.unsplash.com/photo-1625247666944-c93f0ee3da9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1790&q=80",
      background:
          "https://images.unsplash.com/photo-1625247666944-c93f0ee3da9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1790&q=80",
      colorTheme: "As",
      members: 0,
      public: true,
      createdAt: DateTime.parse("2021-09-07"),
      updatedAt: DateTime.parse("2021-09-07"),
    ));
    await database.eventsDao.insertEvent(Event(
      id: "2",
      category: "GetTogether",
      title:
          "Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title ",
      description:
          "Lorem  PageMaker including versions of Lorem Ipsum. Ipsum is simply d Ipsum is sIpsum is simply dIpsum is simply dIpsum is simply dIpsum is simply dIpsum is simply dIpsum is simply dIpsum is simply dimply d Ipsum is simply d Ipsum is simply d",
      eventDate: DateTime.parse("2021-6-07 09:30"),
      image:
          "https://images.unsplash.com/photo-1625247666944-c93f0ee3da9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1790&q=80",
      groupId: "2",
      location:
          "Some Where in AASTUIpsum is simply dIpsum is simply dIpsum is simply dIpsum is simply dIpsum is simply dIpsum is simply dIpsum is simply d",
      attendees: 0,
      createdAt: DateTime.parse("2021-09-07"),
      updatedAt: DateTime.parse("2021-09-07"),
    ));
  }

  Stream<List<Event>> watchEvents() {
    return database.eventsDao.watchEvents();
  }
}
