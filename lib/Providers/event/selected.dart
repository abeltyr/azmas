import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Model/Group/index.dart';
import 'package:flutter/foundation.dart';

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
