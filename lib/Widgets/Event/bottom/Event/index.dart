import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Event/Bottom/Event/explore.dart';
import 'package:azmas/Widgets/Event/Bottom/Event/popular.dart';
import 'package:azmas/Widgets/Event/Bottom/Event/week.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Events extends StatelessWidget {
  final double heightData;
  Events({required this.heightData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightData,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              "Popular",
              style: GoogleFonts.lora(
                color: PlatformTheme.secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                wordSpacing: 1,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          PopularEventCards(),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              "This Week Events",
              style: GoogleFonts.lora(
                color: PlatformTheme.secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                wordSpacing: 1,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          WeekEventCards(),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Text(
              "Explore",
              style: GoogleFonts.lora(
                color: PlatformTheme.secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
                wordSpacing: 1,
              ),
            ),
          ),
          SizedBox(
            height: 2.5,
          ),
          ExploreEventCards(),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
