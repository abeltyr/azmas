import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Screens/Customer/Account/Auth/index.dart';
import 'package:azmas/Screens/Customer/Account/Profile/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final userProvider = Hive.box<UserModel>('users');
  @override
  void initState() {
    super.initState();
    if (userProvider.get("currentUser") != null)
      Provider.of<UserProvider>(context, listen: false).fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<UserModel>('users').listenable(keys: ["currentUser"]),
      builder: (context, box, widget) {
        var boxData = box as Box<UserModel>;
        UserModel? user = boxData.get("currentUser");
        if (user != null && user.token != null)
          return UserProfileScreen(user: user);
        else
          return AuthIndex();
      },
    );
  }
}
