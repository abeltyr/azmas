// import 'package:azmas/Widgets/Event/top/search.dart';
import 'package:azmas/Widgets/Event/top/slideTap.dart';
import 'package:flutter/material.dart';

class EventTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 45, left: 15, right: 15),
      height: 55,
      width: MediaQuery.of(context).size.width - 30,
      alignment: Alignment.center,
      child: Stack(
        children: [
          SlideTap(),
          //TODO: add this back when search is done
          // Positioned(right: 0, child: SearchButton()),
        ],
      ),
    );
  }
}
