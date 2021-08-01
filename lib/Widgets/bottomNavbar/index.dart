import 'package:azmas/Providers/navbar/index.dart';
import 'package:azmas/Providers/navbar/navbar.dart';
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
    final navBarDataProvider =
        Provider.of<NavBarDataProvider>(context, listen: false);

    double widthData = (MediaQuery.of(context).size.width - 40) /
        navBarDataProvider.navBar.length;
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
            if (navBarProvider.selectedScreen != value)
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
      bottom: 12.5,
      left: 15,
      right: 15,
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
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
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: navBarDataProvider.navBar.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) => tab(
            bold: navBarDataProvider.navBar[index].bold,
            broken: navBarDataProvider.navBar[index].broken,
            value: index,
          ),
        ),
      ),
    );
  }
}
