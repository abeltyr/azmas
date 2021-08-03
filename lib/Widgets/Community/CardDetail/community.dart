import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Community/CardDetail/bottom.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityCard extends StatelessWidget {
  final String profile1;
  final String profile2;
  final String profile3;
  final String title;
  final String detail;
  final String communityAvatar;
  final String communityName;
  final DateTime postTime;
  final String poster;
  const CommunityCard({
    required this.title,
    required this.profile1,
    required this.profile2,
    required this.profile3,
    required this.detail,
    required this.communityAvatar,
    required this.communityName,
    required this.poster,
    required this.postTime,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: PlatformTheme.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 7.5,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                margin: EdgeInsets.only(left: 15, right: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      7.5,
                    ),
                  ),
                  child: Container(
                    color: PlatformTheme.primaryColorTransparent,
                    child: LoadedImageView(
                      fitData: BoxFit.fill,
                      imageUrl: communityAvatar,
                    ),
                  ),
                ),
              ),
              Text(
                title,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lora(
                  color: PlatformTheme.darkPrimaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  wordSpacing: 0.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Text(
              detail,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.lora(
                color: PlatformTheme.darkPrimaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 12,
                wordSpacing: 0.5,
                height: 1.3,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          CommunityBottom(
            profile1: profile1,
            profile2: profile2,
            profile3: profile3,
          )
        ],
      ),
    );
  }
}
