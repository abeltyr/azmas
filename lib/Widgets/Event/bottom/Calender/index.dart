import 'package:azmas/Providers/calender/index.dart';
import 'package:azmas/Widgets/Event/bottom/Calender/date.dart';
import 'package:azmas/Widgets/Event/bottom/Calender/top.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calender extends StatelessWidget {
  final double heightData;
  Calender({required this.heightData});
  @override
  Widget build(BuildContext context) {
    //TODO: add a dummy 32 and 0 variable
    final calenderProvider =
        Provider.of<CalenderProvider>(context, listen: false);
    final date = DateTime.now();
    DateTime x1 = DateTime(date.year, date.month, 0).toUtc();
    var y1 =
        DateTime(date.year, date.month + 1, 0).toUtc().difference(x1).inDays;
    print("x1 $x1");
    print(calenderProvider.months.length > calenderProvider.selectedMonths
        ? calenderProvider.months[calenderProvider.selectedMonths]
        : "");
    print("y1 $y1");
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
