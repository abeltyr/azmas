import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final String dateTime;
  const DateWidget({
    required this.dateTime,
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
              color: PlatformTheme.secondaryColorLight,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              wordSpacing: 1,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: boxWidth,
            height: 40,
            padding: EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.5),
              color: PlatformTheme.white,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "$iconData",
                  color: PlatformTheme.secondaryColor,
                  height: 25,
                  width: 25,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "$dateTimeData",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
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
            dateTimeData:
                "${DateFormat.yMMMd().format(DateTime.parse(dateTime))}",
            title: "Date",
            iconData: "assets/Icons/Broken/Calendar.svg",
          ),
          SizedBox(
            width: 25,
          ),
          detailData(
            dateTimeData: "${DateFormat.jm().format(DateTime.parse(dateTime))}",
            title: "Time",
            iconData: "assets/Icons/Broken/Time.svg",
          ),
        ],
      ),
    );
  }
}
