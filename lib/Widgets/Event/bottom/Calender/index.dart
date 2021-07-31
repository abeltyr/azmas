import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Providers/calender/getEvent.dart';
import 'package:azmas/Providers/calender/index.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Event/bottom/Calender/top.dart';
import 'package:azmas/Widgets/Shared/Card/horizontalEventCard.dart';
import 'package:azmas/Widgets/Shared/brokenLine.dart';
import 'package:azmas/Widgets/Shared/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalenderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calenderProvider =
        Provider.of<CalenderProvider>(context, listen: true);
    final double heightData = MediaQuery.of(context).size.height - 100;
    List<int> dates = [];
    List<EventModel?> events = [];
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 10000,
      ),
      height: heightData,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CalenderTop(),
          Container(
            height: heightData - 65,
            child: FutureBuilder(
              future: Provider.of<CalenderEventProvider>(context, listen: false)
                  .getDays(
                month: calenderProvider.months.length > 0
                    ? calenderProvider
                        .months[calenderProvider.selectedMonths].month
                    : calenderProvider.changeData(DateTime.now().month),
                year: calenderProvider.months.length > 0
                    ? calenderProvider
                        .months[calenderProvider.selectedMonths].year
                    : "${DateTime.now().year}",
              ),
              builder: (ctx, snapData) {
                if (snapData.hasData)
                  events = [...snapData.data as List<EventModel?>, null];

                if (snapData.connectionState == ConnectionState.done) {
                  if (events.length <= 1)
                    return Container(
                      height: heightData - 65,
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          AnimationWidget(
                            assetData: 'assets/Animations/Empty.json',
                          ),
                          Text(
                            "No Event This Month",
                            style: GoogleFonts.lora(
                              color: PlatformTheme.textColor2,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              wordSpacing: 0.1,
                            ),
                          ),
                        ],
                      ),
                    );
                  else
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: events.length,
                      itemBuilder: (ctx, index) {
                        if (events[index] == null)
                          return SizedBox(
                            height: 90,
                          );
                        bool showDate = false;
                        if (!dates
                            .contains(events[index]!.eventStartDate.day)) {
                          dates.add(events[index]!.eventStartDate.day);
                          showDate = true;
                        }
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              if (showDate)
                                Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width - 30,
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 65,
                                        child: Text(
                                          "Day ${events[index]!.eventStartDate.day}",
                                          style: GoogleFonts.lora(
                                            color: PlatformTheme
                                                .secondaryColorLight,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            wordSpacing: 0.1,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        // alignment: Alignment.center,
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                95,
                                        child: Center(child: BrokenLine()),
                                      ),
                                    ],
                                  ),
                                ),
                              HorizontalEventCard(
                                dateType: false,
                                title: events[index]!.title,
                                description: events[index]!.description,
                                eventStartDate: events[index]!.eventStartDate,
                                eventImage: events[index]!.image,
                                groupId: events[index]!.groupId,
                                location: events[index]!.location,
                                onClick: () {
                                  // final eventProvider =
                                  //     Provider.of<EventSelectedProvider>(
                                  //         context,
                                  //         listen: false);
                                  // eventProvider.selectEvent(
                                  //     eventData: events[index]);
                                  // Navigator.pushNamed(
                                  //     context, EventDetailScreen.routeName);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                } else if (snapData.connectionState == ConnectionState.waiting)
                  // TODO: added a card loading here
                  return Container();
                else
                  // TODO: added an error page here
                  return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
