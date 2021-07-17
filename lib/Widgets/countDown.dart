import 'dart:async';

import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CountDownWidget extends StatefulWidget {
  final String date;
  const CountDownWidget({required this.date});

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  int days = 0;
  int hours = 0;
  int mins = 0;
  int secs = 0;
  late Timer timerData;

  @override
  void dispose() {
    super.dispose();
    timerData.cancel();
  }

  @override
  void initState() {
    super.initState();
    timerData = new Timer.periodic(Duration(seconds: 1), (Timer t) {
      countDown(DateTime.parse(widget.date));
    });
  }

  void countDown(DateTime mainDay) {
    final toDayDate = DateTime.now();

    if (secs <= 0) {
      var difference = mainDay.difference(toDayDate);
      var tempHours = ((difference.inHours / 24) - difference.inDays);
      var tempMins = ((difference.inMinutes / 60) - difference.inHours);
      var tempSecond = ((difference.inSeconds / 60) - difference.inMinutes);
      setState(() {
        days = difference.inDays;
        hours = (tempHours * 24).toInt();
        mins = (tempMins * 60).toInt();
        secs = (tempSecond * 60).toInt();
      });
    } else
      setState(() {
        secs = secs - 1;
      });
  }

  @override
  Widget build(BuildContext context) {
    Widget display({required String title, required int value}) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$title",
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                color: PlatformTheme.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                wordSpacing: 0.6,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "$value",
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                color: PlatformTheme.white,
                fontWeight: FontWeight.w300,
                fontSize: 18,
                wordSpacing: 1,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: PlatformTheme.thirdColorTransparent,
        borderRadius: BorderRadius.circular(7.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          display(title: "Days", value: days),
          Container(
            decoration: BoxDecoration(
              color: PlatformTheme.white,
            ),
            width: 2,
            height: 20,
          ),
          display(title: "Hrs", value: hours),
          Container(
            decoration: BoxDecoration(
              color: PlatformTheme.white,
            ),
            width: 2,
            height: 20,
          ),
          display(title: "Mins", value: mins),
          Container(
            decoration: BoxDecoration(
              color: PlatformTheme.white,
            ),
            width: 2,
            height: 20,
          ),
          display(title: "Secs", value: secs),
        ],
      ),
    );
  }
}
