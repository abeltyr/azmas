import 'package:azmas/Providers/user/inAppAuth.dart';
import 'package:azmas/Widgets/bottomNavbar/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  static const routeName = "/";
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> with WidgetsBindingObserver {
  bool loggedin = true;
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      final usersProvider =
          Provider.of<InAppAuthProvider>(context, listen: false);
      usersProvider.auteticated(SupportState.NotAuthorized);
    }
  }

  @override
  Widget build(BuildContext context) {
    int selected = 0;
    if (loggedin)
      return Stack(
        children: [
          if (selected == 0)
            Scaffold(
              body: Container(
                child: Text("dsa"),
              ),
            ),
          // IndexCustomer(),
          BottomNavigatorWidget()
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
