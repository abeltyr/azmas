import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CommunityDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 25,
                height: 25,
                child: SvgPicture.asset(
                  "assets/Icons/Broken/Chat.svg",
                  color: PlatformTheme.darkPrimaryColorLight,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "100 K",
                style: GoogleFonts.lora(
                  color: PlatformTheme.darkPrimaryColorLight,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  wordSpacing: 1,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          SaveWidget(),
        ],
      ),
    );
  }
}
