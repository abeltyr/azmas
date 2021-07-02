import 'package:flutter/foundation.dart';

enum SupportState {
  Authorized,
  NotAuthorized,
}

class InAppAuthProvider with ChangeNotifier {
  SupportState _userState = SupportState.Authorized;

  SupportState get userState {
    return _userState;
  }

  Future<void> auteticated(SupportState data) async {
    _userState = data;
    notifyListeners();
  }
}
