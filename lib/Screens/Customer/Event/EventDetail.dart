import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/Providers/event/selected.dart';
import 'package:azmas/Screens/Error/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/EventDetail/date.dart';
import 'package:azmas/Widgets/EventDetail/top.dart';
import 'package:azmas/Widgets/EventDetail/topBar.dart';
import 'package:azmas/Widgets/Shared/Button/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EventDetailScreen extends StatelessWidget {
  static const routeName = "/eventDetail";

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;
    final eventProvider =
        Provider.of<EventSelectedProvider>(context, listen: false);
    Event? event = eventProvider.event;

    if (event != null)
      return Scaffold(
        backgroundColor: PlatformTheme.primaryColor,
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: unnecessary_null_comparison
                if (event == null)
                  Container(
                    margin: EdgeInsets.only(top: 90),
                    width: totalWidth,
                    child: Text(
                      "No Event Selected",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lora(
                        color: PlatformTheme.negative,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        wordSpacing: 1,
                      ),
                    ),
                  )
                else
                  Container(
                    height: totalHeight,
                    width: totalWidth,
                    child: Column(
                      children: [
                        EventTopWidget(
                          image: event.image,
                          eventDate: event.eventDate,
                        ),
                        Container(
                          height: totalHeight - 350,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // "${EnumSetter().eventCategory(event.category)}",
                                      "${event.category}",
                                      style: GoogleFonts.lora(
                                        color: PlatformTheme
                                            .secondaryColorTransparent,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        wordSpacing: 1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      child: Text(
                                        "${event.title}",
                                        style: GoogleFonts.lora(
                                          color: PlatformTheme.secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          wordSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DateWidget(
                                dateTime: event.eventDate,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Location",
                                      style: GoogleFonts.lora(
                                        color:
                                            PlatformTheme.secondaryColorLight,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        wordSpacing: 1,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7.5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.5),
                                        color: PlatformTheme.white,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          // Icon(CupertinoIcons.location),
                                          SvgPicture.asset(
                                            "assets/Icons/Broken/Location.svg",
                                            color: PlatformTheme.secondaryColor,
                                            height: 30,
                                            width: 30,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                90,
                                            child: Text(
                                              "${event.location}",
                                              style: GoogleFonts.lora(
                                                color: PlatformTheme
                                                    .secondaryColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    event.location.length <= 50
                                                        ? 16
                                                        : 14,
                                                wordSpacing: 1,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "About",
                                  style: GoogleFonts.lora(
                                    color: PlatformTheme.secondaryColorLight,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    wordSpacing: 1,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text(
                                  "${event.description}",
                                  style: GoogleFonts.lora(
                                    color: PlatformTheme.secondaryColorLight,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    wordSpacing: 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 90,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
            EventTopBar(),
            if (event.price > 0)
              Positioned(
                bottom: 15,
                child: Container(
                  height: 85,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: PlatformTheme.primaryColorTransparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Price",
                            style: GoogleFonts.lora(
                              color: PlatformTheme.secondaryColorLight,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              wordSpacing: 1,
                            ),
                          ),
                          Text(
                            "${event.price} ETB",
                            style: GoogleFonts.lora(
                              color: PlatformTheme.positive,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              wordSpacing: 1,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      AzmasButton(
                        onClick: () {},
                        borderRadiusData: 7.5,
                        color: PlatformTheme.textColor1,
                        textColor: PlatformTheme.primaryColor,
                        textFontWeight: FontWeight.w400,
                        textFontSize: 18,
                        title: "Book Ticket",
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
    else
      return ErrorScreen();
  }
}
