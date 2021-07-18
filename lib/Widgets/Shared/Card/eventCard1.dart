import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/Providers/group/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/groupIndictor.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:azmas/Widgets/image/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventCardWidget1 extends StatelessWidget {
  final String title;
  final String eventImage;
  final String description;
  final String location;
  final String groupId;
  final String date;
  final Function onClick;

  EventCardWidget1({
    required this.title,
    required this.eventImage,
    required this.description,
    required this.location,
    required this.groupId,
    required this.date,
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
                top: 120,
              ),
              padding: EdgeInsets.only(
                top: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: title.length <= 30 ? 5 : 0,
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
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    child: Text(
                      "$description",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.lora(
                        color: PlatformTheme.secondaryColorLight,
                        fontWeight: FontWeight.w400,
                        fontSize: description.length >= 55 ? 12 : 14,
                        wordSpacing: 0.1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    height: 35,
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FutureBuilder(
                        future:
                            Provider.of<GroupProvider>(context, listen: false)
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
                        }),
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
              top: 90,
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
                      "${DateFormat.d().format(DateTime.parse(date))}",
                      style: GoogleFonts.lora(
                        color: PlatformTheme.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        wordSpacing: 0.1,
                      ),
                    ),
                    Text(
                      "${DateFormat.MMM().format(DateTime.parse(date))}",
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
