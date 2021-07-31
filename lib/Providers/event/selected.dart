import 'package:azmas/Model/Event/index.dart';
import 'package:flutter/foundation.dart';

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
