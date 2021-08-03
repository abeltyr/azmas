import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Utils/timeCalc.dart';
import 'package:azmas/Widgets/Community/CardDetail/communityIndictor.dart';
import 'package:azmas/Widgets/Community/CardDetail/detail.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Discussion extends StatelessWidget {
  final String? image;
  final String? title;
  final String? detail;
  final String communityAvatar;
  final String communityName;
  final DateTime postTime;
  final String poster;
  const Discussion({
    this.image,
    this.title,
    this.detail,
    required this.communityAvatar,
    required this.communityName,
    required this.poster,
    required this.postTime,
  });
  @override
  Widget build(BuildContext context) {
    String imageData = image != null ? "$image" : "";
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      padding: EdgeInsets.only(
        top: 7.5,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: PlatformTheme.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommunityPostIndictor(
            imageUrl: communityAvatar,
            title: "$communityName",
            description:
                "Posted By $poster . ${TimeCalc().dateDifference(postTime)}",
          ),
          if (title != null)
            Container(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
              ),
              child: Text(
                title!,
                style: GoogleFonts.lora(
                  color: PlatformTheme.darkPrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  wordSpacing: 1,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          if (detail != null)
            Container(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                top: 5,
                bottom: 10,
              ),
              child: Text(
                detail!,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.lora(
                  color: PlatformTheme.darkPrimaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  wordSpacing: 1,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          if (image != null)
            Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
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
                    imageUrl: imageData,
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 5,
          ),
          BrokenLine(
            color: PlatformTheme.primaryColor,
            size: 5,
          ),
          CommunityDetail(),
        ],
      ),
    );
  }
}
