import 'package:azmas/Db/moorDatabase.dart';
import 'package:flutter/foundation.dart';

//TODO: remove this to use stream instead
class EventSelectedProvider with ChangeNotifier {
  Event? _event;

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
