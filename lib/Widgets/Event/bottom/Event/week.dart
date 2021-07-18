import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Providers/event/index.dart';
import 'package:azmas/Providers/event/selected.dart';
import 'package:azmas/Screens/Customer/Event/EventDetail.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Card/eventCard3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WeekEventCards extends StatefulWidget {
  @override
  _WeekEventCardsState createState() => _WeekEventCardsState();
}

class _WeekEventCardsState extends State<WeekEventCards> {
  Function _future = () {};
  @override
  void initState() {
    super.initState();
    // _future = Provider.of<EventProvider>(context, listen: false).getWeekEvents;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future(),
        builder: (context, snapshot) {
          final List<EventModel>? events = snapshot.data as List<EventModel>?;
          if (snapshot.hasData && events != null && events.length != 0)
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    "This Week Events",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      wordSpacing: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 335,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: events.length,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width - 100,
                        margin: EdgeInsets.symmetric(
                          horizontal: 7.5,
                        ),
                        child: EventCardWidget3(
                          title: events[index].title,
                          description: events[index].description,
                          date: events[index].dateTime,
                          eventImage: events[index].image,
                          group: events[index].group,
                          location: events[index].location,
                          onClick: () {
                            // final eventProvider =
                            //     Provider.of<EventSelectedProvider>(context,
                            //         listen: false);
                            // eventProvider.selectEvent(eventData: events[index]);
                            // Navigator.pushNamed(
                            //     context, EventDetailScreen.routeName);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          else
            return Container(
              height: 0,
              width: 0,
            );
        });
  }
}
