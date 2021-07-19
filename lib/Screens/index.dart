import 'package:azmas/Model/Settings/index.dart';
import 'package:azmas/Providers/interaction/navbar.dart';
import 'package:azmas/Screens/Customer/Account/index.dart';
import 'package:azmas/Screens/Customer/Event/index.dart';
import 'package:azmas/Screens/Customer/Home/index.dart';
import 'package:azmas/Screens/Guest/Intro/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/animation.dart';
import 'package:azmas/Widgets/bottomNavbar/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  var hiveSettings = Hive.box<SettingModel>('settings');
  SettingModel? settings;

  @override
  void initState() {
    super.initState();
    settings = hiveSettings.get("userSettings");
    if (settings == null) {
      hiveSettings.put(
        "userSettings",
        SettingModel(
          intro: true,
        ),
      );
      settings = hiveSettings.get("userSettings");
    }
  }

  @override
  Widget build(BuildContext context) {
    final navBarProvide = Provider.of<NavBarProvider>(context, listen: true);
    if (navBarProvide.checkIntro) settings = hiveSettings.get("userSettings");

    if (settings != null && settings!.intro) {
      return IntroScreen();
    } else if (settings != null && !settings!.intro) {
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
    } else
      return Scaffold(
        backgroundColor: PlatformTheme.primaryColor,
        body: Center(
          child: AnimationWidget(
            assetData: 'assets/Animations/Loader-1.json',
            durationData: Duration(milliseconds: 2500),
          ),
        ),
      );
  }
}
