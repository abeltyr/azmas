import 'package:flutter/foundation.dart';

class NavBarProvider with ChangeNotifier {
  int _selectedScreen = 2;
  bool _checkIntro = false;

  int get selectedScreen {
    return _selectedScreen;
  }

  bool get checkIntro {
    return _checkIntro;
  }

  void updateSelectedScreen(int data) {
    if (data >= 0 && data <= 5) {
      _selectedScreen = data;
      notifyListeners();
    }
  }

  void updateInto() {
    _checkIntro = true;
    notifyListeners();
  }

  Future<int> getSelectedScreen() async {
    return _selectedScreen;
  }
}
