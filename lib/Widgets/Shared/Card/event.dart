import 'package:azmas/Model/group.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/groupIndictor.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String eventImage;
  final String description;
  final String location;
  final GroupModal group;
  final String date;

  EventCard({
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
          height: 180.0 +
              (description.length < 150
                  ? description.length ~/ 50 * 10.5
                  : 30) -
              (location.length < 50 ? 15 : 0),
          margin: EdgeInsets.only(
            top: 115,
          ),
          padding: EdgeInsets.only(
            top: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                height: 20,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "$title",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    wordSpacing: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 7.5,
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
                    fontSize: 12,
                    wordSpacing: 0.1,
                  ),
                ),
              ),
              SizedBox(
                height: 7.5,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: location.length < 50 ? 20 : 40,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.location,
                      size: location.length < 50 ? 20 : 32.5,
                      color: PlatformTheme.secondaryColor,
                    ),
                    SizedBox(
                      width: 2.5,
                    ),
                    Container(
                      width: 285,
                      child: Text(
                        "$location",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lora(
                          color: PlatformTheme.secondaryColor,
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
              BrokenLine(color: PlatformTheme.primaryColor),
              GroupIndictor(
                title: "${group.title}",
                imageUrl: "${group.avatar}",
              ),
            ],
          ),
        ),
        Container(
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
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
        Positioned(
          right: 0,
          top: 120,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: PlatformTheme.primaryColorTransparent,
              borderRadius: BorderRadius.circular(
                7.5,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${DateFormat.MMMM().format(DateTime.parse(date))}",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    wordSpacing: 0.1,
                  ),
                ),
                SizedBox(
                  height: 1.5,
                ),
                Text(
                  "${DateFormat.d().format(DateTime.parse(date))}",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    wordSpacing: 0.1,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
