import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionCardWidget extends StatelessWidget {
  final String title;
  final String svgData;

  ActionCardWidget({
    required this.title,
    required this.svgData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: (MediaQuery.of(context).size.width - 50) / 4,
      padding: EdgeInsets.only(
        top: 12.5,
        left: 5,
        right: 5,
        bottom: 7.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: PlatformTheme.secondaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 35,
            width: 35,
            child: SvgPicture.asset(
              svgData,
              color: PlatformTheme.white,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: GoogleFonts.lora(
              color: PlatformTheme.white,
              fontWeight: FontWeight.w400,
              wordSpacing: 0.1,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
