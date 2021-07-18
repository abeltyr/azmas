import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Providers/interaction/navbar.dart';
import 'package:azmas/Screens/Customer/Account/index.dart';
import 'package:azmas/Screens/Customer/Event/index.dart';
import 'package:azmas/Screens/Customer/Home/index.dart';
import 'package:azmas/Screens/Guest/index.dart';
import 'package:azmas/Widgets/bottomNavbar/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            Hive.box<UserModel>('users').listenable(keys: ["currentUser"]),
        builder: (context, box, widget) {
          var boxData = box as Box<UserModel>;
          UserModel? user = boxData.get("currentUser");
          final navBarProvide =
              Provider.of<NavBarProvider>(context, listen: true);
          if (user != null)
            return Stack(
              children: [
                if (navBarProvide.selectedScreen == 0)
                  HomeScreen()
                else if (navBarProvide.selectedScreen == 1)
                  EventScreen()
                else if (navBarProvide.selectedScreen == 2)
                  AccountScreen(),
                BottomNavigatorWidget(
                  selectedScreen: navBarProvide.selectedScreen,
                ),
              ],
            );
          else
            return IndexGuest();
        });
  }
}
