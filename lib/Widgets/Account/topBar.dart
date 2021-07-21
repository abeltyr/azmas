import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTopBar extends StatelessWidget {
  final String title;
  AuthTopBar({this.title = "Azmas"});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
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
          Container(
            padding: EdgeInsets.only(right: 30),
            child: Text(
              "$title",
              style: GoogleFonts.lora(
                color: PlatformTheme.textColor1,
                fontWeight: FontWeight.w800,
                fontSize: 20,
                wordSpacing: 1,
                height: 1.4,
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
