import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoCardWidget extends StatelessWidget {
  final String title;
  final String svgLocation;

  InfoCardWidget({
    required this.title,
    required this.svgLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70,
            width: 70,
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: PlatformTheme.secondaryColor,
            ),
            child: SvgPicture.asset(
              svgLocation,
              color: PlatformTheme.white,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.lora(
              color: PlatformTheme.accentColorDark,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
