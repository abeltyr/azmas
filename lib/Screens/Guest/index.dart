import 'package:azmas/Model/Settings/index.dart';
import 'package:azmas/Screens/Guest/Auth/index.dart';
import 'package:azmas/Screens/Guest/Intro/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/loading/small.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IndexGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hiveSettings = Hive.box<SettingModel>('settings');
    return Scaffold(
      backgroundColor: PlatformTheme.primaryColor,
      body: ValueListenableBuilder(
        valueListenable: hiveSettings.listenable(keys: ["userSettings"]),
        builder: (context, box, widget) {
          var boxData = box as Box<SettingModel>;
          SettingModel? settings = boxData.get("userSettings");
          if (settings == null) {
            print("setting in here");
            hiveSettings.put(
              "userSettings",
              SettingModel(
                intro: true,
              ),
            );
          }
          if (settings != null && settings.intro) {
            return IntroScreen();
          } else if (settings != null && !settings.intro) {
            return AuthIndex();
          } else
            return Center(child: SmallLoading());
        },
      ),
    );
  }
}
