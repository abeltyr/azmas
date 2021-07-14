import 'package:azmas/Providers/interaction/navbar.dart';
import 'package:azmas/Screens/Customer/Account/index.dart';
import 'package:azmas/Screens/Customer/Event/index.dart';
import 'package:azmas/Screens/Customer/Home/index.dart';
import 'package:azmas/Widgets/bottomNavbar/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool loggedin = true;

    final navBarProvide = Provider.of<NavBarProvider>(context, listen: true);
    if (loggedin)
      return Stack(
        children: [
          if (navBarProvide.selectedScreen == 0)
            HomeScreen()
          else if (navBarProvide.selectedScreen == 1)
            EventScreen()
          else if (navBarProvide.selectedScreen == 2)
            AccountScreen(),
          // IndexCustomer(),
          BottomNavigatorWidget(
            selectedScreen: navBarProvide.selectedScreen,
          ),
        ],
      );
    else
      return Scaffold(
        body: Center(
          child: Text("done"),
        ),
      );
  }
}
