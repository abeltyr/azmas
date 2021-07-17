import 'package:azmas/Model/countDown.dart';
import 'package:azmas/Providers/interaction/eventScreen.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Event/bottom/Calender/index.dart';
import 'package:azmas/Widgets/Event/bottom/Event/index.dart';
import 'package:azmas/Widgets/Event/bottom/search.dart';
import 'package:azmas/Widgets/Event/top/index.dart';
import 'package:azmas/Widgets/EventDetail/top.dart';
import 'package:azmas/Widgets/countDown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventProvider =
        Provider.of<EventInteractionProvider>(context, listen: true);
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: PlatformTheme.primaryColor,
      body: Stack(
        children: [
          if (eventProvider.selectedTab == 0 && !eventProvider.searchTap)
            Events(heightData: height),
          if (eventProvider.selectedTab == 1 && !eventProvider.searchTap)
            Calender(heightData: height),
          if (eventProvider.searchTap) EventSearch(heightData: height),
          // EventTop(),
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            margin: EdgeInsets.only(top: 55),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Graduation Day Count Down",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.textColor1,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      wordSpacing: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CountDownWidget(
                  date: "2021-10-17",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
