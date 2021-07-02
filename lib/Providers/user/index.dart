import 'package:azmas/Model/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  late UserModel _currentUser = UserModel(
    id: "1",
    avatar: "assets/images/profile.webp",
    account: "2312921390787123",
    firstName: "abel",
    lastName: "lamesgen",
    balance: 1900000,
  );

  UserModel get currentUser {
    return _currentUser;
  }

  void setUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<UserModel> fetchUser() async {
    // fetch the user from the local or online and send the user back
    // for now let just manually set it up. uncomment it to get the guest screen
    // _currentUser = UserModel(id: "sa", email: "SA", phoneNumber: "SA", fullName: "ad");
    return _currentUser;
  }

  void subTract({double data = 0}) async {
    _currentUser.balance = _currentUser.balance! - data;
    notifyListeners();
  }
}
