import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Screens/Customer/Account/EditProfile/index.dart';
import 'package:azmas/Screens/Customer/Account/Scan/index.dart';
import 'package:azmas/Screens/Customer/Account/Ticket/index.dart';
import 'package:azmas/Screens/Customer/Community/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Account/actionCard.dart';
import 'package:azmas/Widgets/Account/socialButton.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  final UserModel user;
  UserProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    final double totalHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: PlatformTheme.primaryColor,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 35,
                bottom: 2.5,
                left: 15,
                right: 15,
              ),
              height: 87.5,
              width: totalWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${user.userName}",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.textColor2,
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      wordSpacing: 0.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showCupertinoModalBottomSheet(
                        context: context,
                        builder: (context) => QRScanScreen(),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.5),
                        color: PlatformTheme.textColor2.withOpacity(0.75),
                      ),
                      child: Icon(
                        CupertinoIcons.qrcode,
                        size: 25,
                        color: PlatformTheme.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Container(
              height: totalHeight - 88.5,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: totalWidth,
                    height: 90,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.5),
                            border: Border.all(
                              width: 1,
                              color: PlatformTheme.textColor2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7.5),
                            child: LoadedImageView(imageUrl: user.avatar),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "${user.fullName}",
                                    style: GoogleFonts.lora(
                                      color: PlatformTheme.textColor1,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      wordSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7.5,
                                ),
                                Container(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      "${user.email}",
                                      style: GoogleFonts.lora(
                                        color: PlatformTheme.textColor2,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7.5,
                                ),
                                Container(
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      "${user.phoneNumber}",
                                      style: GoogleFonts.lora(
                                        color: PlatformTheme.textColor2,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(
                      "Bio",
                      style: GoogleFonts.lora(
                        color: PlatformTheme.textColor2,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        wordSpacing: 0.5,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Text(
                      user.bio == null || user.bio == ""
                          ? "NO Bio Yet"
                          : "${user.bio}",
                      style: GoogleFonts.lora(
                        color: PlatformTheme.textColor2,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        wordSpacing: 0.5,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 50,
                    width: totalWidth,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (user.instagram != "")
                          SocialButton(
                            icon: "assets/Icons/Instagram.svg",
                            url: 'https://instagram.com/${user.instagram}',
                          ),
                        if (user.instagram != "")
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 200) / 5,
                          ),
                        if (user.twitter != "")
                          SocialButton(
                            icon: "assets/Icons/Twitter.svg",
                            url: 'https://www.twitter.com/${user.twitter}',
                          ),
                        if (user.twitter != "")
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 200) / 5,
                          ),
                        if (user.telegram != "")
                          SocialButton(
                            icon: "assets/Icons/Broken/Send.svg",
                            url: 'https://t.me/${user.telegram}',
                          ),
                        if (user.telegram != "")
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 200) / 5,
                          ),
                        if (user.telegram != "")
                          SocialButton(
                            icon: "assets/Icons/Facebook.svg",
                            url: 'https://facebook.com/${user.facebook}',
                          ),
                        if (user.telegram != "")
                          SizedBox(
                            width:
                                (MediaQuery.of(context).size.width - 200) / 5,
                          ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(7.5),
                            decoration: BoxDecoration(
                              color: PlatformTheme.textColor2.withOpacity(0.75),
                              borderRadius: BorderRadius.circular(7.5),
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              "assets/Icons/Broken/Friends.svg",
                              color: PlatformTheme.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  UserActionCard(
                    icon: "assets/Icons/Broken/Setting.svg",
                    textData: "Settings",
                    onClick: () {
                      Navigator.pushNamed(
                        context,
                        SettingScreen.routeName,
                      );
                    },
                  ),
                  UserActionCard(
                    icon: "assets/Icons/Broken/Ticket.svg",
                    textData: "My Tickets",
                    onClick: () {
                      Navigator.pushNamed(
                        context,
                        TicketScreen.routeName,
                      );
                    },
                  ),
                  UserActionCard(
                    icon: "assets/Icons/Broken/Accounts.svg",
                    textData: "Communities",
                    onClick: () {
                      Navigator.pushNamed(
                        context,
                        CommunityScreen.routeName,
                      );
                    },
                  ),
                  UserActionCard(
                    icon: "assets/Icons/Broken/Shield.svg",
                    textData: "Verify Me",
                    onClick: () {},
                  ),
                  Divider(),
                  UserActionCard(
                    icon: "assets/Icons/Broken/Suggestion.svg",
                    textData: "Suggestion",
                    onClick: () {},
                  ),
                  UserActionCard(
                    icon: "assets/Icons/Broken/Chat.svg",
                    textData: "Reach Out",
                    onClick: () {},
                  ),
                  Divider(),
                  UserActionCard(
                    icon: "assets/Icons/Broken/Logout.svg",
                    textData: "Log Out",
                    onClick: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .logout();
                    },
                    showMore: false,
                  ),
                  SizedBox(
                    height: 90,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
