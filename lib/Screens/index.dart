import 'package:azmas/Providers/user/inAppAuth.dart';
import 'package:azmas/Screens/Custmer/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app_badger/flutter_app_badger.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
    if (loggedin)
      return IndexCustomer();
    else
      return Scaffold(
        body: Center(
          child: Text("done"),
        ),
      );
  }
}
