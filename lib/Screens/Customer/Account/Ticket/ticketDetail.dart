import 'package:azmas/Db/moorDatabase.dart';
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
    final ticket = Ticket(
      id: "13",
      price: 0,
      eventDate: DateTime.parse("2021-09-20 07:30"),
      eventId: "13",
      groupId: "3",
      used: false,
      userId: "2",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    final event = Event(
      id: "13",
      category: "Fun Event part 1",
      horizontal: false,
      price: 0,
      title: "Water Day",
      description:
          "A 4 day vacation to Kuriftu where we gone party have fund and get to know people in your batch. make memories that last a life time.",
      eventDate: DateTime.parse("2021-09-20 07:30"),
      image:
          "https://images.unsplash.com/photo-1498747946579-bde604cb8f44?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1789&q=80",
      groupId: "2",
      location: "Some Where in AASTU ",
      attendees: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    Color textColor = PlatformTheme.textColor1;
    Color cardColor = PlatformTheme.white;
    //TODO: change this to the event end Date
    if (event.eventDate.isBefore(DateTime.now().add(Duration(
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
            dateTime: event.eventDate,
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
