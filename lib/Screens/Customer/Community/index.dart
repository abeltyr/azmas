import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Community/topBar.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  static const routeName = "/community";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlatformTheme.primaryColor,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 32.5),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Container(
                //   height: 400,
                //   width: 550,
                //   color: PlatformTheme.textColor1,
                // ),
                // Container(
                //   height: 400,
                //   width: 550,
                //   color: PlatformTheme.textColor2,
                // ),
                // Container(
                //   height: 400,
                //   width: 550,
                //   color: PlatformTheme.textColor1,
                // )
              ],
            ),
          ),
          CommunityTopBar(),
        ],
      ),
    );
  }
}
