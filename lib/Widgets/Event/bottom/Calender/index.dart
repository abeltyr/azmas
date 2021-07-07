import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Event/bottom/Calender/top.dart';
import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  final double heightData;
  Calender({required this.heightData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightData,
      // padding: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 10,
          ),
          CalenderTop(),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
