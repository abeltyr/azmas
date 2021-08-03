import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityBottom extends StatelessWidget {
  final String profile1;
  final String profile2;
  final String profile3;
  const CommunityBottom({
    required this.profile1,
    required this.profile2,
    required this.profile3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 1,
                    color: PlatformTheme.iconColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      75,
                    ),
                  ),
                  child: Container(
                    color: PlatformTheme.primaryColorTransparent,
                    child: LoadedImageView(
                      fitData: BoxFit.fill,
                      imageUrl: profile1,
                    ),
                  ),
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 1,
                    color: PlatformTheme.iconColor,
                  ),
                ),
                margin: EdgeInsets.only(left: 25),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      75,
                    ),
                  ),
                  child: Container(
                    color: PlatformTheme.primaryColorTransparent,
                    child: LoadedImageView(
                      fitData: BoxFit.fill,
                      imageUrl: profile2,
                    ),
                  ),
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 1,
                    color: PlatformTheme.iconColor,
                  ),
                ),
                margin: EdgeInsets.only(left: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      75,
                    ),
                  ),
                  child: Container(
                    color: PlatformTheme.primaryColorTransparent,
                    child: LoadedImageView(
                      fitData: BoxFit.fill,
                      imageUrl: profile3,
                    ),
                  ),
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: PlatformTheme.iconColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    width: 1,
                    color: PlatformTheme.iconColor,
                  ),
                ),
                margin: EdgeInsets.only(left: 75),
                alignment: Alignment.center,
                child: Text(
                  "99+",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lora(
                    color: PlatformTheme.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    wordSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 30,
            child: AzmasButton(
              onClick: () {},
              title: "Join",
              borderRadiusData: 7.5,
              color: PlatformTheme.iconColor,
              textFontSize: 15,
              textFontWeight: FontWeight.w400,
              textColor: PlatformTheme.white,
            ),
          )
        ],
      ),
    );
  }
}
