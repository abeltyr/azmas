import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  final double heightData;
  Events({required this.heightData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightData,
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
