import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/Model/Event/index.dart';
import 'package:flutter/foundation.dart';

//TODO: remove this to use stream instead
class EventSelectedProvider with ChangeNotifier {
  EventModel? _event;

  EventModel? get event {
    return _event;
  }

  Future<void> selectEvent({
    required EventModel? eventData,
  }) async {
    _event = eventData;
    notifyListeners();
  }
}
