import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 320,
          height: 320,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: PlatformTheme.primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Text("Meas"),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: PlatformTheme.white,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  7.5,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "21",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      wordSpacing: 0.1,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    "Dec",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      wordSpacing: 0.1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
