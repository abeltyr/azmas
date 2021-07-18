import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
  Future<void> insertEvents() async {
    await database.groupsDao.insertGroup(Group(
      id: "3",
      category: "GetTogether",
      title: "GC 2013",
      description: "Lorem  PageMaker including versions of Lorem Ipsum.",
      avatar:
          "https://images.unsplash.com/photo-1599420186946-7b6fb4e297f0?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
      background:
          "https://images.unsplash.com/photo-1599420186946-7b6fb4e297f0?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
      colorTheme: "As",
      members: 0,
      public: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ));
    await database.eventsDao.insertEvent(Event(
      id: "6",
      category: "Fun Event",
      horizontal: false,
      price: 999.99,
      title: "Pool Party",
      description:
          // "A Day full of excitement and fun with Water spraying and friends. get a chance to enjoy the day by dripping your friends in water.",
          // "A Day full of excitement and fun with colors and friends. get a chance to enjoy the day painting on your or your friend face and t-shirt",
          "A 4 day vacation to Kuriftu where we gone party have fund and get to know people in your batch. make memories that last a life time.",
      eventDate: DateTime.parse("2021-08-20 08:30"),
      image:
          "https://images.unsplash.com/photo-1498747946579-bde604cb8f44?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1789&q=80",
      groupId: "3",
      location: "Some where there is a pool",
      attendees: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ));
  }

  Stream<List<Event>> watchEvents() {
    return database.eventsDao.watchEvents();
  }
}
