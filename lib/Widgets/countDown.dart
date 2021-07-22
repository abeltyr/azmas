import 'dart:async';

import 'package:azmas/Providers/countDown/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CountDownWidget extends StatefulWidget {
  final String date;
  final Color textColor;
  final bool showSecond;
  final Function onDone;
  const CountDownWidget({
    required this.date,
    this.textColor = PlatformTheme.textColor1,
    this.showSecond = true,
    required this.onDone,
  });

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  int days = 1;
  int hours = 0;
  int mins = 0;
  int secs = 0;
  bool loading = true;
  late Timer timerData;

  @override
  void dispose() {
    super.dispose();
    timerData.cancel();
  }

  @override
  void initState() {
    super.initState();
    loading = true;
    timerData = new Timer.periodic(Duration(seconds: 1), (Timer t) {
      countDown(DateTime.parse(widget.date));
    });
  }

  void countDown(DateTime mainDay) {
    final toDayDate = DateTime.now();
    var difference = mainDay.difference(toDayDate);
    var tempHours = ((difference.inHours / 24) - difference.inDays);
    var tempMins = ((difference.inMinutes / 60) - difference.inHours);
    var tempSecond = ((difference.inSeconds / 60) - difference.inMinutes);
    if (days <= 0 && hours <= 0 && mins <= 0 && secs <= 0) {
      timerData.cancel();
      widget.onDone();
      setState(() {
        days = 0;
        hours = 0;
        mins = 0;
        secs = 0;
        loading = false;
      });
    } else
      setState(() {
        days = difference.inDays;
        hours = (tempHours * 24).round();
        mins = (tempMins * 60).round();
        secs = (tempSecond * 60).round();
        loading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    Widget display({required String title, required int value}) {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              loading ? "--" : "$value",
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                color: widget.textColor,
                fontWeight: FontWeight.w300,
                fontSize: 18,
                wordSpacing: 1,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "$title",
              textAlign: TextAlign.center,
              style: GoogleFonts.lora(
                color: widget.textColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                wordSpacing: 0.6,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          display(title: "Days", value: days),
          Container(
            child: Text(
              ":",
              style: TextStyle(
                color: widget.textColor,
                fontSize: 25,
              ),
            ),
          ),
          display(title: "Hrs", value: hours),
          Container(
            child: Text(
              ":",
              style: TextStyle(
                color: widget.textColor,
                fontSize: 25,
              ),
            ),
          ),
          display(title: "Mins", value: mins),
          if (widget.showSecond)
            Container(
              child: Text(
                ":",
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 25,
                ),
              ),
            ),
          if (widget.showSecond) display(title: "Secs", value: secs),
        ],
      ),
    );
  }
}
