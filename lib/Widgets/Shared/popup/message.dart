import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class MessagePopUp extends StatelessWidget {
  final String title;
  final String subText;
  final String cancel;
  final String accept;
  final Function? acceptFunction;
  final Function? cancelFunction;
  final Color? acceptColor;
  final Color? cancelColor;
  const MessagePopUp({
    required this.title,
    required this.subText,
    required this.cancel,
    required this.accept,
    this.cancelFunction,
    this.acceptFunction,
    this.cancelColor = PlatformTheme.fourthColor,
    this.acceptColor = PlatformTheme.textColor2,
  });

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: (totalWidth - 300) / 2,
        vertical: (totalHeight - 175) / 2,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      child: Text(
                        "$title",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lora(
                          color: PlatformTheme.textColor1,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          wordSpacing: 0.5,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Text(
                        "$subText",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lora(
                          color: PlatformTheme.textColor1,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          wordSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        width: 125,
                        child: AzmasButton(
                          color: PlatformTheme.fourthColor,
                          onClick: () {
                            Navigator.pop(context);
                            cancelFunction!();
                          },
                          textFontSize: 14,
                          title: cancel,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 125,
                        child: AzmasButton(
                          color: PlatformTheme.textColor2,
                          onClick: () {
                            Navigator.pop(context);
                            acceptFunction!();
                          },
                          textFontSize: 14,
                          title: accept,
                        ),
                      )
                    ],
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
