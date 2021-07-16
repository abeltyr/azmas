import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopWidget extends StatelessWidget {
  final Color iconColor;
  TopWidget({required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.only(
                right: 15,
                top: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: PlatformTheme.thirdColorTransparent,
              ),
              child: Icon(
                CupertinoIcons.xmark,
                size: 25,
                color: PlatformTheme.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
