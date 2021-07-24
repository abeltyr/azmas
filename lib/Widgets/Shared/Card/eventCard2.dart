import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/Providers/group/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/groupIndictor.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HorizontalEventCard extends StatelessWidget {
  final String title;
  final String eventImage;
  final String description;
  final String location;
  final String groupId;
  final DateTime eventStartDate;
  final Function onClick;
  final bool dateType;

  HorizontalEventCard({
    required this.title,
    required this.eventImage,
    required this.description,
    required this.location,
    required this.groupId,
    required this.eventStartDate,
    required this.onClick,
    this.dateType = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: LayoutBuilder(builder: (ctx, data) {
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
              width: MediaQuery.of(context).size.width - 30,
              margin: EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Container(
                    // height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 90,
                          width: 100,
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.5, vertical: 5),
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
                                imageUrl: "$eventImage",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 90,
                          width: data.maxWidth - 100,
                          padding: EdgeInsets.only(right: 15, top: 7.5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 22.5,
                                width: data.maxWidth - 100,
                                child: Text(
                                  "$title",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lora(
                                    color: PlatformTheme.secondaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    wordSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: Text(
                                  "$description",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lora(
                                    color: PlatformTheme.secondaryColorLight,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                    wordSpacing: 0.1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 18,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.location_solid,
                                      size: 18,
                                      color: PlatformTheme.primaryColorDark,
                                    ),
                                    SizedBox(
                                      width: 2.5,
                                    ),
                                    Container(
                                      width: data.maxWidth - 150,
                                      child: Text(
                                        "$location",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lora(
                                          color: PlatformTheme.primaryColorDark,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BrokenLine(
                    color: PlatformTheme.primaryColor,
                    size: 5,
                  ),
                  FutureBuilder(
                    future: Provider.of<GroupProvider>(context, listen: false)
                        .getGroup(groupId),
                    builder: (context, snapshot) {
                      Group? group = snapshot.data as Group?;
                      if (group != null && snapshot.hasData)
                        return GroupIndictor(
                          title: "${group.title}",
                          imageUrl: "${group.avatar}",
                        );
                      else
                        return Container();
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 25,
                width: !dateType ? 90 : 100,
                decoration: BoxDecoration(
                  color: PlatformTheme.accentColorDark,
                  borderRadius: BorderRadius.circular(
                    7.5,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dateType
                        ? SvgPicture.asset(
                            "assets/Icons/Broken/Calendar.svg",
                            color: PlatformTheme.white,
                            height: 16,
                            width: 16,
                          )
                        : SvgPicture.asset(
                            "assets/Icons/Broken/Time.svg",
                            color: PlatformTheme.white,
                            height: 16,
                            width: 16,
                          ),
                    SizedBox(
                      width: 7.5,
                    ),
                    Container(
                      child: Text(
                        "${dateType ? DateFormat.yMMMd().format(eventStartDate) : DateFormat.jm().format(eventStartDate)}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lora(
                          color: PlatformTheme.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          wordSpacing: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.5,
                    ),
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
