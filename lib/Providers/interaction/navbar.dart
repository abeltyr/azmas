import 'package:flutter/foundation.dart';

class NavBarProvider with ChangeNotifier {
  int _selectedScreen = 0;

  int get selectedScreen {
    return _selectedScreen;
  }

  void updateSelectedScreen(int data) {
    if (data >= 0 && data <= 5) {
      _selectedScreen = data;
      notifyListeners();
    }
  }
}
