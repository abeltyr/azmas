import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Event/bottom/Calender/date.dart';
import 'package:azmas/Widgets/Event/bottom/Calender/top.dart';
import 'package:flutter/material.dart';

class Calender extends StatelessWidget {
  final double heightData;
  Calender({required this.heightData});
  @override
  Widget build(BuildContext context) {
    //TODO: add a dummy 32 and 0 variable
    return Container(
      height: heightData - 20,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      width: MediaQuery.of(context).size.width,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 10,
          ),
          CalenderTop(),
          Container(
            height: heightData - 75,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 33,
                itemBuilder: (ctx, index) {
                  if (index == 0)
                    return SizedBox(
                      height: 10,
                    );

                  if (index == 32)
                    return SizedBox(
                      height: 85,
                    );
                  else
                    return CalenderDate(plans: [1, 2, 3], day: index + 1);
                }),
          ),
        ],
      ),
    );
  }
}
