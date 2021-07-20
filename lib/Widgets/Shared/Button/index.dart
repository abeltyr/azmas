import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AzmasButton extends StatefulWidget {
  final Function onClick;
  final String title;
  final Color color;
  final Color textColor;
  final FontWeight textFontWeight;
  final double textFontSize;
  final double borderRadiusData;
  final bool loading;

  const AzmasButton({
    required this.onClick,
    required this.title,
    this.color = PlatformTheme.positive,
    this.textColor = PlatformTheme.primaryColor,
    this.textFontWeight = FontWeight.w800,
    this.textFontSize = 20,
    this.borderRadiusData = 15.0,
    this.loading = false,
  });

  @override
  _AzmasButtonState createState() => _AzmasButtonState();
}

class _AzmasButtonState extends State<AzmasButton> {
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.loading) widget.onClick();
      },
      onTapDown: (onTapDown) {
        if (!widget.loading)
          setState(() {
            opacity = 0.7;
          });
      },
      onTapUp: (onTapUp) {
        setState(() {
          opacity = 1;
        });
      },
      onTapCancel: () {
        setState(() {
          opacity = 1;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 10000),
        child: Opacity(
          opacity: opacity,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(widget.borderRadiusData),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "${widget.title}",
                style: GoogleFonts.lora(
                  color: widget.textColor,
                  fontWeight: widget.textFontWeight,
                  fontSize: opacity == 1
                      ? widget.textFontSize
                      : widget.textFontSize + 2,
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
