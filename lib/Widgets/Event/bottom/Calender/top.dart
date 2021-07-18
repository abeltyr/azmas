import 'package:azmas/Model/calender.dart';
import 'package:azmas/Providers/calender/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalenderTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calenderProvider =
        Provider.of<CalenderProvider>(context, listen: false);
    return FutureBuilder(
        future: calenderProvider.getMonths(),
        builder: (context, snapshot) {
          // TODO Add aloader of card animation here if the data collection takes longer
          if (snapshot.hasData) {
            final newCalenderProvider =
                Provider.of<CalenderProvider>(context, listen: true);
            List<CalenderModel> months = newCalenderProvider.months;
            int selectedMonth = newCalenderProvider.selectedMonths;
            return Container(
              height: 55,
              child: ListView.builder(
                itemCount: months.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      calenderProvider.updateMonth(index);
                    },
                    child: Container(
                      width: 60,
                      decoration: BoxDecoration(
                        color: selectedMonth == index
                            ? PlatformTheme.secondaryColor
                            : PlatformTheme.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${DateFormat('MMM').format(
                              DateTime.parse(
                                  '${DateTime.now().year}-${months[index].month}-01'),
                            )}",
                            style: GoogleFonts.lora(
                              color: selectedMonth == index
                                  ? PlatformTheme.white
                                  : PlatformTheme.secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              wordSpacing: 0.1,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else
            return Container();
        });
  }
}
