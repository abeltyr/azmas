import 'package:azmas/Providers/interaction/communityScreen.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Community/Bottom/Blog/index.dart';
import 'package:azmas/Widgets/Community/Bottom/Explore/index.dart';
import 'package:azmas/Widgets/Community/Bottom/Following/index.dart';
import 'package:azmas/Widgets/Community/Top/topBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommunityScreen extends StatelessWidget {
  static const routeName = "/community";

  @override
  Widget build(BuildContext context) {
    final communityProvider =
        Provider.of<CommunityInteractionProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: PlatformTheme.primaryColor,
      body: Column(
        children: [
          CommunityTopBar(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            margin: EdgeInsets.only(bottom: 40),
            height: MediaQuery.of(context).size.height - 125,
            child: IndexedStack(
              index: communityProvider.selectedTab,
              children: [
                ExploreScreen(),
                FollowingScreen(),
                BlogScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
