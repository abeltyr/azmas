import 'package:azmas/Providers/interaction/eventScreen.dart';
import 'package:azmas/Widgets/Event/top/search.dart';
import 'package:azmas/Widgets/Event/top/slideTap.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<EventProvider>(context, listen: true);

    return Container(
      margin: EdgeInsets.only(top: 55, left: 15, right: 15),
      height: 65,
      width: MediaQuery.of(context).size.width - 30,
      child: Stack(
        children: [
          SlideTap(),
          Positioned(right: 0, child: SearchButton()),
        ],
      ),
    );
  }
}
