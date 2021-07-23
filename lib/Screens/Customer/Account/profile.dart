import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Account/top.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    final double totalHeight = MediaQuery.of(context).size.height;
    final double secondImageData = 150;
    return Scaffold(
      backgroundColor: PlatformTheme.primaryColor,
      body: Stack(
        children: [
          Container(
            height: totalHeight - 320,
            margin: EdgeInsets.only(top: 280),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: totalWidth,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: Text(
                    "Azmas",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.secondaryColor,
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      wordSpacing: 1,
                    ),
                  ),
                ),
                Container(
                  width: totalWidth,
                  height: 50,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: (totalWidth - 300) / 2,
                  ),
                  child: AzmasButton(
                    onClick: () {},
                    color: PlatformTheme.thirdColor,
                    title: "Join",
                  ),
                ),
                Container(
                  width: totalWidth,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: Text(
                    "Info",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      wordSpacing: 1,
                    ),
                  ),
                ),
                Container(
                  width: totalWidth,
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 15,
                  ),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularized in the 1960s with the release of Leeriest sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Lauds PageMaker including versions of Lorem Ipsum.",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      wordSpacing: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 320,
            color: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  height: 280,
                  color: Colors.transparent,
                  width: totalWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: LoadedImageView(
                      imageUrl:
                          "https://images.unsplash.com/photo-1482203460252-be3456f7c8d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: (totalWidth - secondImageData) / 2,
                  right: (totalWidth - secondImageData) / 2,
                  child: Container(
                    width: secondImageData,
                    height: secondImageData - 5,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: PlatformTheme.primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        color: PlatformTheme.primaryColor),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: LoadedImageView(
                        imageUrl:
                            "https://images.unsplash.com/photo-1551504436-ea077650a6f3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
                      ),
                    ),
                  ),
                ),
                AccountTopBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
