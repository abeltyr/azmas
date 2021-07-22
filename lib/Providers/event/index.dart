import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
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
    await database.eventsDao.insertEvent(Event(
      id: "141",
      category: "Fun Event",
      horizontal: false,
      price: 900,
      title: "Trip TO Kuriftu part 1",
      description:
          "A Day full of excitement and fun with Water spraying and friends. get a chance to enjoy the day by dripping your friends in water.",
      // "A Day full of excitement and fun with colors and friends. get a chance to enjoy the day painting on your or your friend face and t-shirt",
      // "A 4 day vacation to Kuriftu where we gone party have fund and get to know people in your batch. make memories that last a life time.",
      eventDate: DateTime.parse("2021-08-21 08:30"),
      image:
          "https://images.unsplash.com/photo-1450609283058-0ec52fa7eac4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
      groupId: "2",
      location: "Kuriftu",
      attendees: 1000,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ));
    await database.eventsDao.insertEvent(Event(
      id: "12",
      category: "Fun Event ",
      horizontal: false,
      price: 0,
      title: "Color Day",
      description:
          // "A Day full of excitement and fun with Water spraying and friends. get a chance to enjoy the day by dripping your friends in water.",
          "A Day full of excitement and fun with colors and friends. get a chance to enjoy the day painting on your or your friend face and t-shirt",
      // "A 4 day vacation to Kuriftu where we gone party have fund and get to know people in your batch. make memories that last a life time.",
      eventDate: DateTime.parse("2021-09-20 12:30"),
      image:
          "https://images.unsplash.com/photo-1496024840928-4c417adf211d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
      groupId: "2",
      location: "AASTU Some Where",
      attendees: 100,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ));
    await database.eventsDao.insertEvent(Event(
      id: "13",
      category: "Fun Event part 1",
      horizontal: true,
      price: 0,
      title: "Water Day",
      description:
          // "A Day full of excitement and fun with Water spraying and friends. get a chance to enjoy the day by dripping your friends in water.",
          // "A Day full of excitement and fun with colors and friends. get a chance to enjoy the day painting on your or your friend face and t-shirt",
          "A 4 day vacation to Kuriftu where we gone party have fund and get to know people in your batch. make memories that last a life time.",
      eventDate: DateTime.parse("2021-07-20 07:30"),
      image:
          "https://images.unsplash.com/photo-1498747946579-bde604cb8f44?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1789&q=80",
      groupId: "2",
      location: "AASTU Some Where",
      attendees: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ));
  }

  Stream<List<Event>> watchEvents() {
    return database.eventsDao.watchEvents();
  }
}
