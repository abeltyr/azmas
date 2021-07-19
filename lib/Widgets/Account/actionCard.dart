import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserActionCard extends StatelessWidget {
  final String icon;
  final String textData;
  final Function onClick;
  final bool showMore;
  const UserActionCard(
      {required this.icon,
      required this.textData,
      required this.onClick,
      this.showMore = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: PlatformTheme.boxColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: SvgPicture.asset(
                icon,
                color: PlatformTheme.textColor2,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                child: Text(
                  "$textData",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.textColor2,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    wordSpacing: 0.5,
                  ),
                ),
              ),
            ),
            if (showMore)
              Container(
                child: Icon(
                  CupertinoIcons.forward,
                  color: PlatformTheme.textColor2,
                ),
              )
          ],
        ),
      ),
    );
  }
}
