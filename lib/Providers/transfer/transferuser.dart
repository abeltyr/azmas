import 'package:azmas/Model/user.dart';
import 'package:flutter/foundation.dart';

class TransferUserProvider with ChangeNotifier {
  late UserModel _transferUser = UserModel(
    id: "0",
    firstName: "Mike",
    lastName: "LastName",
    account: "**8102",
    avatar: "assets/images/user1.jpeg",
  );
  UserModel get transferUser {
    return _transferUser;
  }

  void setUser(UserModel user) {
    _transferUser = user;
    notifyListeners();
  }

  Future<void> setTransctionUser({required UserModel userData}) async {
    _transferUser = userData;
    notifyListeners();
  }
}
