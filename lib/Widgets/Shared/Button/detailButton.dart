import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AzmasDetailButton extends StatefulWidget {
  final Function onClick;
  final String title;
  final Color color;
  final Color textColor;
  final FontWeight textFontWeight;
  final double textFontSize;
  final double borderRadiusData;
  final bool loading;

  const AzmasDetailButton({
    required this.onClick,
    required this.title,
    this.color = PlatformTheme.positive,
    this.textColor = PlatformTheme.secondaryColor,
    this.textFontWeight = FontWeight.w800,
    this.textFontSize = 20,
    this.borderRadiusData = 15.0,
    this.loading = false,
  });

  @override
  _AzmasDetailButtonState createState() => _AzmasDetailButtonState();
}

class _AzmasDetailButtonState extends State<AzmasDetailButton> {
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
      child: Container(
        height: 50,
        child: Opacity(
          opacity: opacity,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: opacity == 1
                  ? Colors.transparent
                  : PlatformTheme.white.withOpacity(0.5),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${widget.title}",
                        style: GoogleFonts.lora(
                          color: widget.loading
                              ? PlatformTheme.textColor2.withOpacity(0.7)
                              : widget.textColor,
                          fontWeight: widget.textFontWeight,
                          fontSize: widget.textFontSize,
                          wordSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Icon(
                    CupertinoIcons.forward,
                    color: PlatformTheme.textColor2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
