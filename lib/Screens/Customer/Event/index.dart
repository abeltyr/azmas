import 'package:azmas/Providers/interaction/eventScreen.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Event/Bottom/Calender/index.dart';
import 'package:azmas/Widgets/Event/Bottom/Event/index.dart';
import 'package:azmas/Widgets/Event/Bottom/search.dart';
import 'package:azmas/Widgets/Event/top/index.dart';
import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          EventTop(),
          if (eventProvider.selectedTab == 0 && !eventProvider.searchTap)
            EventLists(),
          if (eventProvider.selectedTab == 1 && !eventProvider.searchTap)
            CalenderScreen(),
          if (eventProvider.searchTap) EventSearch(heightData: height),
        ],
      ),
    );
  }
}
