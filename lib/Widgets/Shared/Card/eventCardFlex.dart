import 'package:azmas/Model/Community/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/communityIndictor.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventCardFlexWidget extends StatelessWidget {
  final String title;
  final String eventImage;
  final String? description;
  final String location;
  final String communityId;
  final CommunityModel? community;
  final DateTime eventStartDate;
  final Function onClick;

  EventCardFlexWidget({
    required this.title,
    required this.eventImage,
    this.description,
    required this.location,
    required this.communityId,
    this.community,
    required this.eventStartDate,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: LayoutBuilder(builder: (context, data) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: PlatformTheme.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    7.5,
                  ),
                ),
              ),
              margin: EdgeInsets.only(
                top: 160,
              ),
              padding: EdgeInsets.only(
                top: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: Text(
                      "$title",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lora(
                        color: PlatformTheme.secondaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: title.length <= 30 ? 20 : 16,
                        wordSpacing: 0.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    child: Text(
                      "$description",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lora(
                        color: PlatformTheme.secondaryColorLight,
                        fontWeight: FontWeight.w400,
                        fontSize: description!.length >= 55 ? 12 : 14,
                        wordSpacing: 0.1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.location,
                          size: location.length < 45 ? 20 : 25,
                          color: PlatformTheme.accentColor,
                        ),
                        SizedBox(
                          width: 2.5,
                        ),
                        Container(
                          width: data.maxWidth - 50,
                          child: Text(
                            "$location",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lora(
                              color: PlatformTheme.accentColor,
                              fontWeight: FontWeight.w400,
                              fontSize: location.length < 45 ? 14 : 12,
                              fontStyle: FontStyle.italic,
                              wordSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BrokenLine(
                    color: PlatformTheme.primaryColor,
                    size: 5,
                  ),
                  if (community != null)
                    GroupIndictor(
                      title: "${community!.title}",
                      imageUrl: "${community!.avatar}",
                    )
                ],
              ),
            ),
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
                  height: 30,
                  width: 30,
                  child: LoadedImageView(
                    fitData: BoxFit.fill,
                    imageUrl: "$eventImage",
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 140,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: PlatformTheme.secondaryColorTransparent,
                  borderRadius: BorderRadius.circular(
                    7.5,
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${DateFormat.d().format(eventStartDate)}",
                      style: GoogleFonts.lora(
                        color: PlatformTheme.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        wordSpacing: 0.1,
                      ),
                    ),
                    Text(
                      "${DateFormat.MMM().format(eventStartDate)}",
                      style: GoogleFonts.lora(
                        color: PlatformTheme.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        wordSpacing: 0.1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
