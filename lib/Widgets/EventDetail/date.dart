import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final DateTime dateTime;
  final Color textColor;
  final Color boxColor;
  final Color boxTextColor;
  const DateWidget({
    required this.dateTime,
    this.textColor = PlatformTheme.secondaryColorLight,
    this.boxColor = PlatformTheme.white,
    this.boxTextColor = PlatformTheme.secondaryColor,
  });
  @override
  Widget build(BuildContext context) {
    final boxWidth = (MediaQuery.of(context).size.width - 55) / 2;

    Widget detailData({String? iconData, String? dateTimeData, String? title}) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title",
            style: GoogleFonts.lora(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              wordSpacing: 1,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: boxWidth,
            height: 40,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.5),
              color: boxColor,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "$iconData",
                  color: boxTextColor,
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "$dateTimeData",
                  style: GoogleFonts.lora(
                    color: boxTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    wordSpacing: 0.5,
                  ),
                ),
              ],
            ),
          )
        ],
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      child: Wrap(
        children: [
          detailData(
            dateTimeData: "${DateFormat.yMMMd().format(dateTime)}",
            title: "Date",
            iconData: "assets/Icons/Broken/Calendar.svg",
          ),
          SizedBox(
            width: 25,
          ),
          detailData(
            dateTimeData: "${DateFormat.jm().format(dateTime)}",
            title: "Time",
            iconData: "assets/Icons/Broken/Time.svg",
          ),
        ],
      ),
    );
  }
}
