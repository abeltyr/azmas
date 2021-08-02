import 'package:flutter/foundation.dart';

class CommunityInteractionProvider with ChangeNotifier {
  int _selectedTab = 0;
  int get selectedTab {
    return _selectedTab;
  }

  void updateSelectedTap(int data) {
    if (data >= 0 && data <= 2) {
      _selectedTab = data;
      notifyListeners();
    }
  }
}
