import 'package:flutter/foundation.dart';

class NavBarProvider with ChangeNotifier {
  int _selectedScreen = 2;

  int get selectedScreen {
    return _selectedScreen;
  }

  void updateSelectedScreen(int data) {
    if (data >= 0 && data <= 5) {
      _selectedScreen = data;
      notifyListeners();
    }
  }

  Future<int> getSelectedScreen() async {
    return _selectedScreen;
  }
}
