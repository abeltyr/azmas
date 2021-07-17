import 'package:azmas/Model/Event/index.dart';
import 'package:flutter/foundation.dart';

class CalenderEventProvider with ChangeNotifier {
  List<EventModel> _days = [];

  List<EventModel> get days {
    return _days;
  }

  Future<List<EventModel>> getDays() async {
    //TODO: fetch all the event of the month
    _days = [
      EventModel(
        id: "1",
        dateTime: DateTime.now().toIso8601String(),
        attended: 100,
        category: EventCategory.Fun,
        description: "polasdj ",
        groupId: "sad",
        location: "here",
        title: "asd",
        group: null,
        image:
            "https://images.unsplash.com/photo-1625247666944-c93f0ee3da9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1790&q=80",
      ),
      EventModel(
        id: "2",
        dateTime: DateTime.now().toIso8601String(),
        attended: 100,
        category: EventCategory.Fun,
        description: "polasdj ",
        groupId: "sad",
        location: "here",
        title: "asd",
        group: null,
        image:
            "https://images.unsplash.com/photo-1625247666944-c93f0ee3da9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1790&q=80",
      ),
    ];
    return _days;
  }
}
