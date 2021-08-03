import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Community/CardDetail/postIndictor.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCard extends StatelessWidget {
  final String image;
  final String title;
  final String detail;
  final String avatar;
  final String communityName;
  final bool communityVerification;
  final DateTime postTime;
  final String poster;
  final String readTime;
  const PostCard({
    required this.image,
    required this.title,
    required this.detail,
    required this.avatar,
    required this.communityName,
    this.communityVerification = true,
    required this.poster,
    required this.postTime,
    required this.readTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      width: MediaQuery.of(context).size.width - 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width - 30) / 3.4,
                height: (MediaQuery.of(context).size.width - 30) / 3.4,
                color: PlatformTheme.primaryColorTransparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      5,
                    ),
                  ),
                  child: LoadedImageView(
                    fitData: BoxFit.fill,
                    imageUrl: image,
                  ),
                ),
              ),
              SizedBox(
                width: 7.5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              5,
                            ),
                          ),
                          child: Container(
                            color: PlatformTheme.primaryColorTransparent,
                            height: 17.5,
                            width: 17.5,
                            child: LoadedImageView(
                              fitData: BoxFit.fill,
                              imageUrl: avatar,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$poster . $communityName",
                          style: GoogleFonts.lora(
                            color: PlatformTheme.darkPrimaryColorDark,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            wordSpacing: 1,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (communityVerification)
                          Container(
                            height: 15,
                            width: 15,
                            child: SvgPicture.asset(
                              "assets/Icons/Bold/Verification.svg",
                              // color: PlatformTheme.positive,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Text(
                      "$title",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lora(
                        color: PlatformTheme.darkPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        wordSpacing: 0.4,
                        height: 1.05,
                      ),
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Text(
                      "$detail",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lora(
                        color: PlatformTheme.darkPrimaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        wordSpacing: 0.5,
                        height: 1.2,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          PostIndictor(
            date: DateTime.now(),
            readTime: "$readTime",
            author: "$poster",
          ),
          // BrokenLine(),
          Divider(
            thickness: 1,
            color: PlatformTheme.white,
          )
        ],
      ),
    );
  }
}
