import 'package:azmas/Screens/Custmer/transacrions/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Home/actions.dart';
import 'package:azmas/Widgets/Home/people.dart';
import 'package:azmas/Widgets/Home/top.dart';
import 'package:azmas/Widgets/card/balanceCard.dart';
import 'package:azmas/Widgets/Home/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IndexCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlatformTheme.primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          HomeScreenTop(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: PlatformTheme.white,
            ),
            height: (MediaQuery.of(context).size.height) - 140,
            width: double.infinity,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                BalanceCard(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AppLocalizations.of(context)!.services,
                    style: GoogleFonts.lora(
                      color: PlatformTheme.accentColorDark,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ActionWidget(),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.sendMoney,
                        style: GoogleFonts.lora(
                          color: PlatformTheme.accentColorDark,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("here");
                        },
                        child: Container(
                          width: 80,
                          color: Colors.transparent,
                          alignment: Alignment.centerRight,
                          height: 30,
                          child: Icon(
                            CupertinoIcons.plus_circle,
                            color: PlatformTheme.accentColorDark,
                            size: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                PeopleListWidget(),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.transactions,
                        style: GoogleFonts.lora(
                          color: PlatformTheme.accentColorDark,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, TransactionScreens.routeName);
                        },
                        child: Container(
                          width: 50,
                          color: Colors.transparent,
                          alignment: Alignment.centerRight,
                          height: 30,
                          child: Icon(
                            CupertinoIcons.right_chevron,
                            color: PlatformTheme.accentColorDark,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TransctionWidget(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
