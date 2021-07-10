import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';

class EventSearch extends StatelessWidget {
  final double heightData;
  EventSearch({required this.heightData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightData,
      color: PlatformTheme.negative,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
