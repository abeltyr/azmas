import 'package:azmas/Db/moorDatabase.dart';
import 'package:flutter/foundation.dart';

//TODO: remove this to use stream instead
class EventSelectedProvider with ChangeNotifier {
  Event? _event = Event(
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
  );

  Event? get event {
    return _event;
  }

  Future<void> selectEvent({
    required Event? eventData,
  }) async {
    _event = eventData;
    notifyListeners();
  }
}
