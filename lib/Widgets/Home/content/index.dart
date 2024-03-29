import 'package:azmas/Widgets/Shared/Card/home.dart';
import 'package:flutter/material.dart';

class EventContentWidget extends StatelessWidget {
  const EventContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) {
          return MainCard();
        },
      ),
    );
  }
}
