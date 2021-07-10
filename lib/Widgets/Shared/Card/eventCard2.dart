import 'package:azmas/Model/group.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/groupIndictor.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventCardWidget2 extends StatelessWidget {
  final String title;
  final String eventImage;
  final String description;
  final String location;
  final GroupModal group;
  final String date;

  EventCardWidget2({
    required this.title,
    required this.eventImage,
    required this.description,
    required this.location,
    required this.group,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
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
          height: 145,
          margin: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 95,
                    width: 100,
                    padding:
                        EdgeInsets.symmetric(horizontal: 7.5, vertical: 7.5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          7.5,
                        ),
                      ),
                      child: Container(
                        color: PlatformTheme.fourthColor,
                        height: 30,
                        width: 30,
                        child: LoadedImageView(
                          fitData: BoxFit.fill,
                          imageUrl: "$eventImage",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: 100,
                    padding: EdgeInsets.only(right: 15, top: 7.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$title",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lora(
                            color: PlatformTheme.secondaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            wordSpacing: 1,
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            "$description",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lora(
                              color: PlatformTheme.secondaryColorLight,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
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
                                width: 200,
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
                  ))
                ],
              ),
              BrokenLine(
                color: PlatformTheme.primaryColor,
                size: 5,
              ),
              GroupIndictor(
                title: "${group.title}",
                imageUrl: "${group.avatar}",
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 30,
            width: 90,
            decoration: BoxDecoration(
              color: PlatformTheme.accentColorDark,
              borderRadius: BorderRadius.circular(
                5,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.time_solid,
                  size: 18,
                  color: PlatformTheme.white,
                ),
                SizedBox(
                  width: 2.5,
                ),
                Container(
                  child: Text(
                    "${DateFormat.jm().format(DateTime.parse(date))}",
                    maxLines: 2,
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
