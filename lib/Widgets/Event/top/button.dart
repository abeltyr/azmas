import 'package:azmas/Providers/interaction/eventScreen.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventTopButton extends StatelessWidget {
  final int numValue;
  final String? title;

  EventTopButton({this.numValue = 0, this.title});

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        eventProvider.updateSelectedTap(numValue);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 7.5),
        height: 55,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        width: (MediaQuery.of(context).size.width - 30) * 2 / 6 - 15,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            "$title",
            style: GoogleFonts.lora(
              color: eventProvider.selectedTab == numValue
                  ? PlatformTheme.white
                  : PlatformTheme.secondaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
