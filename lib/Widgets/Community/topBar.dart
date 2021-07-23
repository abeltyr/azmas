import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: PlatformTheme.white,
              ),
              child: Icon(
                CupertinoIcons.back,
                size: 25,
                color: PlatformTheme.secondaryColor,
              ),
            ),
          ),
          Container(),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: PlatformTheme.white,
              ),
              child: Icon(
                CupertinoIcons.rectangle_on_rectangle_angled,
                size: 25,
                color: PlatformTheme.textColor2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
