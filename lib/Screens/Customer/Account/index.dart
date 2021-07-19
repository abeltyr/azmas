import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Screens/Customer/Account/Profile/user.dart';
import 'package:azmas/Screens/Guest/Auth/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<UserModel>('users').listenable(keys: ["currentUser"]),
      builder: (context, box, widget) {
        var boxData = box as Box<UserModel>;
        UserModel? user = boxData.get("currentUser");
        if (user != null)
          return UserProfileScreen(user: user);
        else
          return AuthIndex();
      },
    );
  }
}
