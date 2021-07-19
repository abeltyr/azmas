import 'package:azmas/Model/User/index.dart';
import 'package:azmas/Providers/user/index.dart';
import 'package:azmas/Screens/Customer/Account/Scan/index.dart';
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
    final description =
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

    final double totalWidth = MediaQuery.of(context).size.width;
    final double totalHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: PlatformTheme.primaryColor,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 40,
                left: 15,
                right: 15,
              ),
              height: 85,
              width: totalWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "username",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.textColor2,
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      wordSpacing: 0.5,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          padding: EdgeInsets.all(7.5),
                          decoration: BoxDecoration(
                            color: PlatformTheme.secondaryColorTransparent,
                            borderRadius: BorderRadius.circular(7.5),
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            "assets/Icons/Broken/Accounts.svg",
                            color: PlatformTheme.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
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
                            color: PlatformTheme.secondaryColorTransparent,
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
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            Container(
              height: totalHeight - 101,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 2.5,
                  ),
                  Container(
                    width: totalWidth,
                    height: 110,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.5),
                            border: Border.all(
                              width: 2,
                              color: PlatformTheme.secondaryColor,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: LoadedImageView(
                              imageUrl:
                                  "https://images.unsplash.com/photo-1551504436-ea077650a6f3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            height: 110,
                            padding: EdgeInsets.symmetric(vertical: 2.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Abel Lamesgen",
                                        style: GoogleFonts.lora(
                                          color: PlatformTheme.textColor1,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          wordSpacing: 0.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 50,
                                  width: totalWidth,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SocialButton(
                                        icon: "assets/Icons/Instagram.svg",
                                        url: 'https://instagram.com/aveltyr',
                                      ),
                                      SocialButton(
                                        icon: "assets/Icons/Twitter.svg",
                                        url: 'https://www.twitter.com/aveltyr',
                                      ),
                                      SocialButton(
                                        icon: "assets/Icons/Broken/Send.svg",
                                        url: 'https://t.me/aveltyr',
                                      ),
                                    ],
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
                      "${description.substring(0, 200)}",
                      style: GoogleFonts.lora(
                        color: PlatformTheme.textColor2,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        wordSpacing: 0.5,
                      ),
                    ),
                  ),
                  Divider(),
                  UserActionCard(
                    icon: "assets/Icons/Broken/Setting.svg",
                    textData: "Edit Profile",
                    onClick: () {},
                  ),
                  UserActionCard(
                    icon: "assets/Icons/Broken/Ticket.svg",
                    textData: "My Tickets",
                    onClick: () {},
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
