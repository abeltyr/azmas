import 'package:azmas/Model/notification.dart';
import 'package:azmas/Providers/notification/sendNotifcation.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreenTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UserProvider>(context, listen: true);
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                usersProvider.currentUser.avatar,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${AppLocalizations.of(context)!.hello}, ${usersProvider.currentUser.firstName}",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.white,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 0.1,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.welcome,
                  style: GoogleFonts.lora(
                    color: PlatformTheme.white,
                    fontWeight: FontWeight.w400,
                    fontSize: Localizations.localeOf(context) == Locale("en")
                        ? 14
                        : 12,
                    wordSpacing: 0.1,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              print("here");
              Provider.of<SendNotificationProvider>(context, listen: false)
                  .sendNotification(
                ReceivedNotification(
                  id: 0,
                  body: "This is your notifcation",
                  title: "AvBirr",
                  payload: "",
                ),
              );
            },
            child: Container(
              width: 35,
              height: 35,
              child: SvgPicture.asset(
                "assets/icons/Notification.svg",
                color: PlatformTheme.white,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
