import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';

class BottomNavigatorWidget extends StatelessWidget {
  const BottomNavigatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 10,
      right: 10,
      child: Container(
        width: MediaQuery.of(context).size.width - 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: PlatformTheme.primaryColorDark,
        ),
        height: 75,
      ),
    );
  }
}
