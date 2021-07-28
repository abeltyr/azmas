import 'package:azmas/Providers/countDown/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/animation.dart';
import 'package:azmas/Widgets/countDown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventCountDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CountDownProvider>(context, listen: true)
          .getCountDownDate(),
      builder: (context, snapshot) {
        Map? data = snapshot.data as Map?;
        if (data == null)
          return Container();
        else
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            height: 250,
            decoration: BoxDecoration(
              color: PlatformTheme.white,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Graduation Day Count Down",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.textColor1,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      wordSpacing: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                    child: Center(
                  child: AnimationWidget(
                    assetData: data["done"]
                        ? 'assets/Animations/Confetti.json'
                        : 'assets/Animations/Rocket.json',
                    durationData: Duration(milliseconds: 5000),
                  ),
                )),
                SizedBox(
                  height: 15,
                ),
                CountDownWidget(
                  onDone: () {
                    Provider.of<CountDownProvider>(context, listen: false)
                        .counterDone();
                  },
                  date: data["date"],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          );
      },
    );
  }
}
