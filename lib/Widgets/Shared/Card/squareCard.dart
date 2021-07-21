import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SquareCard extends StatelessWidget {
  final String title;
  final String icon;
  final Function onClick;
  const SquareCard({
    required this.title,
    required this.icon,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: (totalWidth - 60) / 2,
        height: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: PlatformTheme.primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "$icon",
              fit: BoxFit.contain,
              color: PlatformTheme.textColor2,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "$title",
                style: GoogleFonts.lora(
                  color: PlatformTheme.textColor1,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  wordSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
