import 'package:azmas/Model/Settings/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print("here");
              var hiveSettings = Hive.box<SettingModel>('settings');
              hiveSettings.put(
                "userSettings",
                SettingModel(
                  intro: false,
                ),
              );
            },
            child: Text(
              "Intro",
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                color: PlatformTheme.secondaryColor,
                fontWeight: FontWeight.w800,
                fontSize: 22,
                wordSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
