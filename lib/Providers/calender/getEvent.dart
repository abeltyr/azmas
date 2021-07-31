import 'package:azmas/Model/Event/index.dart';
import 'package:flutter/foundation.dart';

class CalenderEventProvider with ChangeNotifier {
  List<EventModel> _days = [];

  List<EventModel> get days {
    return _days;
  }

  Future<List<EventModel>> getDays({
    required String month,
    required String year,
  }) async {
    return [];
    // return database.eventsDao.getEvents(
    //   startDate: DateTime.parse("$year-$month-01"),
    //   endDate: DateTime.parse("$year-$month-31"),
    // );
  }
}
