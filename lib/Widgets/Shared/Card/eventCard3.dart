import 'package:azmas/Model/group.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/groupIndictor.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventCardWidget3 extends StatelessWidget {
  final String title;
  final String eventImage;
  final String description;
  final String location;
  final GroupModal group;
  final String date;

  EventCardWidget3({
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
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "$title",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    wordSpacing: 0.5,
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
                height: location.length < 50 ? 20 : 25,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.location,
                      size: location.length < 50 ? 20 : 25,
                      color: PlatformTheme.accentColor,
                    ),
                    SizedBox(
                      width: 2.5,
                    ),
                    Container(
                      width: 250,
                      child: Text(
                        "$location",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lora(
                          color: PlatformTheme.accentColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
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
              GroupIndictor(
                title: "${group.title}",
                imageUrl: "${group.avatar}",
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 100,
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
                  "${DateFormat.d().format(DateTime.parse(date))}",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    wordSpacing: 0.1,
                  ),
                ),
                Text(
                  "${DateFormat.MMMM().format(DateTime.parse(date))}",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
                    fontWeight: FontWeight.w800,
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
