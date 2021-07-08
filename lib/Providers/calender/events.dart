import 'package:azmas/Model/calender.dart';
import 'package:azmas/Model/event.dart';
import 'package:flutter/foundation.dart';

class EventProvider with ChangeNotifier {
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
        category: "fun",
        description: "polasdj ",
        groupId: "sad",
        place: "here",
        title: "asd",
        group: null,
      ),
      EventModel(
        id: "2",
        dateTime: DateTime.now().toIso8601String(),
        attended: 100,
        category: "fun",
        description: "polasdj ",
        groupId: "sad",
        place: "here",
        title: "asd",
        group: null,
      ),
    ];
    return _days;
  }
}
