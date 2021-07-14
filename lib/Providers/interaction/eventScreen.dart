import 'package:flutter/foundation.dart';

class EventInteractionProvider with ChangeNotifier {
  int _selectedTab = 0;
  bool _searchTap = false;

  int get selectedTab {
    return _selectedTab;
  }

  bool get searchTap {
    return _searchTap;
  }

  void updateSelectedTap(int data) {
    if (data >= 0 && data <= 1) {
      _selectedTab = data;
      notifyListeners();
    }
  }

  void updateSearchTap(bool data) {
    _searchTap = data;
    notifyListeners();
  }
}
