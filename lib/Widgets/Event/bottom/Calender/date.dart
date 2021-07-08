import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/shared/brokenLine.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalenderDate extends StatelessWidget {
  final List plans;
  final int day;
  CalenderDate({required this.plans, required this.day});

  @override
  Widget build(BuildContext context) {
    int heightVariable = plans.length == 0 ? 1 : plans.length;
    double heightConstant = 110.0;
    double heightDate = heightConstant * heightVariable;
    return Container(
      height: plans.length == 0 ? 100 : heightDate + 30,
      width: MediaQuery.of(context).size.width - 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            width: (MediaQuery.of(context).size.width - 30) / 6,
            alignment: Alignment.center,
            child: Text(
              "Day $day",
              style: GoogleFonts.lora(
                color: PlatformTheme.secondaryColorLight,
                fontWeight: FontWeight.w600,
                fontSize: 16,
                wordSpacing: 0.1,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 20,
                    width: (MediaQuery.of(context).size.width - 30) * 5 / 6,
                    // alignment: Alignment.center,
                    child: BrokenLine(),
                  ),
                  if (plans.length == 0)
                    Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: PlatformTheme.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "No Activity",
                        style: GoogleFonts.lora(
                          color: PlatformTheme.secondaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          wordSpacing: 0.1,
                        ),
                      ),
                    )
                  else
                    Container(
                      height: heightDate,
                      width: double.infinity,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: plans.length,
                          itemBuilder: (ctx, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                bottom: 10,
                              ),
                              height: heightConstant - 10,
                              decoration: BoxDecoration(
                                color: PlatformTheme.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            );
                          }),
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
