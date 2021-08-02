import 'package:azmas/Providers/interaction/communityScreen.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommunityTopButton extends StatelessWidget {
  final int numValue;
  final String? title;

  CommunityTopButton({this.numValue = 0, this.title});

  @override
  Widget build(BuildContext context) {
    final eventProvider =
        Provider.of<CommunityInteractionProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        eventProvider.updateSelectedTap(numValue);
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 7.5,
        ),
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        width: numValue < 2
            ? (MediaQuery.of(context).size.width - 30) / 3.4
            : (MediaQuery.of(context).size.width - 30) / 4,
        child: Text(
          "$title",
          textAlign: TextAlign.center,
          style: GoogleFonts.lora(
            color: eventProvider.selectedTab == numValue
                ? PlatformTheme.white
                : PlatformTheme.darkPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
