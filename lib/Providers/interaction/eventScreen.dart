import 'package:flutter/foundation.dart';

class EventProvider with ChangeNotifier {
  int _selectedTab = 0;
  bool _searchTap = true;

  int get selectedTab {
    return _selectedTab;
  }

  bool get searchTap {
    return _searchTap;
  }

  void updateSelectedTap(int data) {
    if (data >= 0 && data <= 2) {
      _selectedTab = data;
      notifyListeners();
    }
  }

  void updateSearchTap(bool data) {
    _searchTap = data;
    notifyListeners();
  }
}
