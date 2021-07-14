import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AzmasButton extends StatefulWidget {
  final Function onClick;
  final String title;
  const AzmasButton({required this.onClick, required this.title});

  @override
  _AzmasButtonState createState() => _AzmasButtonState();
}

class _AzmasButtonState extends State<AzmasButton> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 5000),
      child: Opacity(
        opacity: opacity,
        child: GestureDetector(
          onTap: () {
            widget.onClick();
          },
          onTapDown: (onTapDown) {
            setState(() {
              opacity = 0.7;
            });
            print("onTapDown.globalPosition ${onTapDown.globalPosition}");
          },
          onTapUp: (onTapUp) {
            print("onTapUp.globalPosition ${onTapUp.globalPosition}");
            setState(() {
              opacity = 1;
            });
          },
          onTapCancel: () {
            setState(() {
              opacity = 1;
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: PlatformTheme.positive,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "${widget.title}",
                style: GoogleFonts.lora(
                  color: PlatformTheme.primaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  wordSpacing: 1,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
