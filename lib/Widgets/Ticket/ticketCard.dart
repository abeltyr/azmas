import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/verticalBrokenLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    final ticketId = "SAas";
    final dateTime = DateTime.now();
    final used = "Paid";
    Color textColor = PlatformTheme.textColor1;
    Color cardColor = PlatformTheme.white;
    if (used == "Used") {
      textColor = PlatformTheme.white;
      cardColor = PlatformTheme.textColor2;
    }
    if (used == "Expired") {
      textColor = PlatformTheme.white;
      cardColor = PlatformTheme.fourthColor;
    }
    return Container(
      height: 150,
      width: totalWidth,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Row(
        children: [
          Container(
            width: (totalWidth - 30) * 0.65,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lora(
                        color: textColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        wordSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 1.5,
                    ),
                    Text(
                      "Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Title Titl",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lora(
                          color: textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          wordSpacing: 1,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 1.5,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        // Icon(CupertinoIcons.location),
                        SvgPicture.asset(
                          "assets/Icons/Broken/Location.svg",
                          color: PlatformTheme.secondaryColor,
                          height: 17.5,
                          width: 17.5,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            "AASTU",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lora(
                              color: PlatformTheme.secondaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              wordSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/Icons/Broken/Calendar.svg",
                                color: textColor,
                                height: 15,
                                width: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${DateFormat.yMMMd().format(dateTime)}",
                                style: GoogleFonts.lora(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/Icons/Broken/Time.svg",
                                color: textColor,
                                height: 15,
                                width: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${DateFormat.jm().format(dateTime)}",
                                style: GoogleFonts.lora(
                                  color: textColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  wordSpacing: 0.5,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          VerticalBrokenLine(
            color: textColor,
          ),
          Container(
            width: (totalWidth - 60) * 0.35,
            // height: 200,
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: QrImage(
              data: "website.com/Ticket/$ticketId",
              eyeStyle: QrEyeStyle(
                eyeShape: QrEyeShape.square,
              ),
              foregroundColor: textColor,
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
