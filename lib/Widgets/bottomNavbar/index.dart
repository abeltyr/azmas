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
    double widthData = (MediaQuery.of(context).size.width - 40) / 2;
    final navBarProvider = Provider.of<NavBarProvider>(context, listen: false);
    Widget tab({
      required Function onClick,
      required String bold,
      required String broken,
    }) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        width: widthData,
        height: double.infinity,
        child: CupertinoButton(
          onPressed: () {
            onClick();
          },
          child: SvgPicture.asset(
            selectedScreen == 1 ? bold : broken,
            color: PlatformTheme.secondaryColor,
            height: selectedScreen == 1 ? 35 : 30,
            width: selectedScreen == 1 ? 35 : 30,
          ),
        ),
      );
    }

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
            // tab(
            //   bold: "assets/Icons/Bold/Home.svg",
            //   broken: "assets/Icons/Broken/Home.svg",
            //   onClick: () {
            //     navBarProvider.updateSelectedScreen(0);
            //   },
            // ),
            tab(
              bold: "assets/Icons/Bold/Calendar.svg",
              broken: "assets/Icons/Broken/Calendar.svg",
              onClick: () {
                navBarProvider.updateSelectedScreen(1);
              },
            ),
            tab(
              bold: "assets/Icons/Bold/Profile.svg",
              broken: "assets/Icons/Broken/Profile.svg",
              onClick: () {
                navBarProvider.updateSelectedScreen(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
