import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: PlatformTheme.secondaryColorTransparent,
              ),
              child: Icon(
                CupertinoIcons.qrcode,
                size: 25,
                color: PlatformTheme.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.all(7.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: PlatformTheme.secondaryColorTransparent,
              ),
              child: SvgPicture.asset(
                "assets/Icons/Broken/Edit.svg",
                color: PlatformTheme.white,
                height: 20,
                width: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
