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
      required String bold,
      required String broken,
      required int value,
    }) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        width: widthData,
        height: double.infinity,
        child: CupertinoButton(
          onPressed: () {
            navBarProvider.updateSelectedScreen(value);
          },
          child: SvgPicture.asset(
            selectedScreen == value ? bold : broken,
            color: PlatformTheme.secondaryColor,
            height: selectedScreen == 1 ? 35 : 30,
            width: selectedScreen == 1 ? 35 : 30,
          ),
        ),
      );
    }

    return Positioned(
      bottom: 10,
      left: 20,
      right: 20,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: PlatformTheme.white,
          boxShadow: [
            BoxShadow(
              color: PlatformTheme.secondaryColor.withOpacity(0.15),
              spreadRadius: 2.5,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
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
              value: 1,
            ),
            tab(
              bold: "assets/Icons/Bold/Profile.svg",
              broken: "assets/Icons/Broken/Profile.svg",
              value: 2,
            ),
          ],
        ),
      ),
    );
  }
}
