import 'package:azmas/Model/User/index.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserProvider with ChangeNotifier {
  UserModel? _currentUser = Hive.box<UserModel>('users').get("currentUser");
  var userProfile = Hive.box<UserModel>('users');

  UserModel? get currentUser {
    return _currentUser;
  }

  Future<void> login() async {
    setupUser(
      UserModel(
        id: "1",
        avatar: "https://source.unsplash.com/random",
        fullName: "abel lamesgen",
        userName: "ADS",
      ),
    );
  }

  Future<void> signUp() async {
    setupUser(
      UserModel(
        id: "1",
        avatar: "https://source.unsplash.com/random",
        fullName: "abel lamesgen",
        userName: "ADS",
      ),
    );
  }

  void setupUser(UserModel userData) {
    userProfile.put(
      "currentUser",
      userData,
    );
  }

  void logout() {
    userProfile.delete("currentUser");
  }
}
