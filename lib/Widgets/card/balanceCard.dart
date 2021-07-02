import 'package:azmas/Providers/interaction/index.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BalanceCard extends StatelessWidget {
  // bool viewAble = false;
  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat('#,###,000');
    final usersProvider = Provider.of<UserProvider>(context, listen: true);
    final interactionProvider =
        Provider.of<InteractionProvider>(context, listen: true);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      width: MediaQuery.of(context).size.width,
      height: 175,
      padding: EdgeInsets.only(
        left: 30,
        right: 20,
        top: 35,
      ),
      decoration: BoxDecoration(
        color: PlatformTheme.secondaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${interactionProvider.viewAble ? "${numberFormat.format(usersProvider.currentUser.balance)}" : "****"} ${AppLocalizations.of(context)!.etb}",
                style: GoogleFonts.lora(
                  color: PlatformTheme.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  wordSpacing: 0.1,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  // final provider =
                  //     Provider.of<LanguageProvider>(context, listen: false);
                  // if (viewAble)
                  //   provider.changeLanguage(Locale("em"));
                  // else
                  //   provider.changeLanguage(Locale("am"));

                  interactionProvider.updateViewAble();
                },
                child: Container(
                  width: 45,
                  child: Icon(
                    interactionProvider.viewAble
                        ? CupertinoIcons.eye_fill
                        : CupertinoIcons.eye_slash,
                    size: 30,
                    color: PlatformTheme.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.totalBalance,
              style: GoogleFonts.lora(
                color: PlatformTheme.accentColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                wordSpacing: 0.1,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  "${AppLocalizations.of(context)!.bankAccount}: ",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.accentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "${interactionProvider.viewAble ? "${usersProvider.currentUser.account}" : "${usersProvider.currentUser.account.substring(0, 2)}**********${usersProvider.currentUser.account.substring(12, 16)}"}",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
