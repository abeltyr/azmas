import 'package:azmas/Providers/interaction/communityScreen.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Community/Top/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommunityTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final communityProvider =
        Provider.of<CommunityInteractionProvider>(context, listen: false);
    final widthData = communityProvider.selectedTab < 2
        ? (MediaQuery.of(context).size.width - 30) / 3.4
        : (MediaQuery.of(context).size.width - 30) / 4;
    return Container(
      margin: EdgeInsets.only(top: 35),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 50,
      child: Stack(
        children: [
          AnimatedContainer(
            margin: EdgeInsets.only(
              top: 7.5,
              bottom: 7.5,
              left: communityProvider.selectedTab < 2
                  ? (widthData * communityProvider.selectedTab) + 7.5
                  : (MediaQuery.of(context).size.width - 22.5) - widthData,
            ),
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: PlatformTheme.darkPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
            width: widthData - 15,
            duration: Duration(
              milliseconds: 150,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CommunityTopButton(
                    numValue: 0,
                    title: "Explore",
                  ),
                  CommunityTopButton(
                    numValue: 1,
                    title: "Following",
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 0,
                ),
                width: 1,
                color: PlatformTheme.darkPrimaryColor,
                height: 25,
              ),
              CommunityTopButton(
                numValue: 2,
                title: "Blogs",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
