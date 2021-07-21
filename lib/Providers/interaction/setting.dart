import 'package:flutter/foundation.dart';

class SettingInteractionProvider with ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab {
    return _selectedTab;
  }

  void updateSelectedTap(int data) {
    if (data >= 0 && data < 4) {
      _selectedTab = data;
      notifyListeners();
    }
  }
}
