import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBarWidget extends StatelessWidget {
  final String title;
  TopBarWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.lora(
                  color: PlatformTheme.accentColorDark,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Positioned(
            left: 1,
            child: GestureDetector(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                child: Icon(
                  CupertinoIcons.left_chevron,
                  size: 25,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
