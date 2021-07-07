import 'package:azmas/Providers/interaction/navbar.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BottomNavigatorWidget extends StatelessWidget {
  final int selectedScreen;
  const BottomNavigatorWidget({required this.selectedScreen});

  @override
  Widget build(BuildContext context) {
    double widthData = (MediaQuery.of(context).size.width - 40) / 3;
    final navBarProvider = Provider.of<NavBarProvider>(context, listen: false);
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: PlatformTheme.white,
        ),
        height: 65,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              width: widthData,
              height: double.infinity,
              child: CupertinoButton(
                onPressed: () {
                  navBarProvider.updateSelectedScreen(0);
                },
                child: SvgPicture.asset(
                  selectedScreen == 0
                      ? "assets/Icons/Bold/Home.svg"
                      : "assets/Icons/Broken/Home.svg",
                  color: PlatformTheme.secondaryColor,
                  height: selectedScreen == 0 ? 35 : 30,
                  width: selectedScreen == 0 ? 35 : 30,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              width: widthData,
              height: double.infinity,
              child: CupertinoButton(
                onPressed: () {
                  navBarProvider.updateSelectedScreen(1);
                },
                child: SvgPicture.asset(
                  selectedScreen == 1
                      ? "assets/Icons/Bold/Calendar.svg"
                      : "assets/Icons/Broken/Calendar.svg",
                  color: PlatformTheme.secondaryColor,
                  height: selectedScreen == 1 ? 35 : 30,
                  width: selectedScreen == 1 ? 35 : 30,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              width: widthData,
              height: double.infinity,
              child: CupertinoButton(
                onPressed: () {
                  navBarProvider.updateSelectedScreen(2);
                },
                child: SvgPicture.asset(
                  selectedScreen == 2
                      ? "assets/Icons/Bold/Profile.svg"
                      : "assets/Icons/Broken/Profile.svg",
                  color: PlatformTheme.secondaryColor,
                  height: selectedScreen == 2 ? 35 : 30,
                  width: selectedScreen == 2 ? 35 : 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
