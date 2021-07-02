import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PeopleCardWidget extends StatelessWidget {
  final String title;
  final String imageLocation;

  PeopleCardWidget({
    required this.title,
    required this.imageLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // color: PlatformTheme.secondaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageLocation,
              width: 70,
              height: 70,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: GoogleFonts.lora(
              color: PlatformTheme.accentColorDark,
              fontWeight: FontWeight.w700,
              wordSpacing: 0.1,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
