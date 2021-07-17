import 'package:azmas/Model/User/index.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserProvider with ChangeNotifier {
  UserModel? _currentUser = Hive.box<UserModel>('users').get("currentUser");

  UserModel? get currentUser {
    return _currentUser;
  }

  void setUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<UserModel?> getUserLocally() async {
    var users = Hive.box<UserModel>('users');
    print(users.get("currentUser"));
    users.put(
      "currentUser",
      UserModel(
        id: "1",
        avatar: "https://source.unsplash.com/random",
        firstName: "abel",
        lastName: "lamesgen",
        userName: "ADS",
      ),
    );
    // print(users.delete("currentUser"));
    return _currentUser;
  }

  void logout() {
    Hive.box<UserModel>('users')..delete("currentUser");
  }
}
