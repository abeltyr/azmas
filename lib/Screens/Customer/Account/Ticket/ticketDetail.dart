
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/EventDetail/date.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:azmas/Widgets/Ticket/QrData.dart';
import 'package:azmas/Widgets/Ticket/listData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ticket;
    var event;
    Color textColor = PlatformTheme.textColor1;
    Color cardColor = PlatformTheme.white;
    //TODO: change this to the event end Date
    if (event.eventStartDate.isBefore(DateTime.now().add(Duration(
      days: 3,
    )))) {
      textColor = PlatformTheme.white;
      cardColor = PlatformTheme.fourthColor;
    }
    if (ticket.used) {
      textColor = PlatformTheme.white;
      cardColor = PlatformTheme.textColor2;
    }

    return Scaffold(
      backgroundColor: cardColor,
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: PlatformTheme.secondaryColor,
                borderRadius: BorderRadius.circular(150),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          QrData(
            image: event.image,
            textColor: textColor,
            ticketId: ticket.id,
          ),
          SizedBox(
            height: 7.5,
          ),
          BrokenLine(),
          SizedBox(
            height: 7.5,
          ),
          ListData(
            mainText: "Abel Lamesgen",
            title: "Name",
            textColor: textColor,
          ),
          SizedBox(
            height: 5,
          ),
          ListData(
            mainText: "${event.title}",
            title: "Event",
            textColor: textColor,
          ),
          DateWidget(
            textColor: textColor,
            dateTime: event.eventStartDate,
            boxColor: Colors.transparent,
            boxTextColor: textColor,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Location",
                  style: GoogleFonts.lora(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    wordSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/Icons/Broken/Location.svg",
                        color: textColor,
                        height: event.location.length > 50 ? 30 : 25,
                        width: event.location.length > 50 ? 30 : 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 90,
                        child: Text(
                          "${event.location}",
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lora(
                            color: textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: event.location.length <= 50 ? 16 : 14,
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
        ],
      ),
    );
  }
}
