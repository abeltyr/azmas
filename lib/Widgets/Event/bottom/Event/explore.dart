import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Providers/event/index.dart';
import 'package:azmas/Providers/event/selected.dart';
import 'package:azmas/Screens/Customer/Event/EventDetail.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Card/eventCard2.dart';
import 'package:azmas/Widgets/Shared/empty.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExploreEventCards extends StatefulWidget {
  @override
  _ExploreEventCardsState createState() => _ExploreEventCardsState();
}

class _ExploreEventCardsState extends State<ExploreEventCards> {
  Function _future = () {};
  @override
  void initState() {
    super.initState();
    // _future =
    // Provider.of<EventProvider>(context, listen: false).getExploreEvents;
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
                  "Explore",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    wordSpacing: 1,
                  ),
                ),
              ),
              SizedBox(
                height: 2.5,
              ),
              Container(
                height: events.length * 160,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: events.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (ctx, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width - 100,
                      margin: EdgeInsets.symmetric(
                        vertical: 2.5,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      // child: EventCardWidget2(
                      //   title: events[index].title,
                      //   description: events[index].description,
                      //   date: events[index].dateTime,
                      //   eventImage: events[index].image,
                      //   group: events[index].group,
                      //   location: events[index].location,
                      //   onClick: () {
                      //     // final eventProvider =
                      //     //     Provider.of<EventSelectedProvider>(context,
                      //     //         listen: false);
                      //     // eventProvider.selectEvent(eventData: events[index]);
                      //     // Navigator.pushNamed(
                      //     //     context, EventDetailScreen.routeName);
                      //   },
                      // ),
                    );
                  },
                ),
              ),
            ],
          );
        else
          return Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                AnimationWidget(),
                Container(
                  child: Text(
                    "No Event Were Found please refresh",
                    style: GoogleFonts.lora(
                      color: PlatformTheme.textColor2,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      wordSpacing: 0.5,
                    ),
                  ),
                )
              ],
            ),
          );
      },
    );
  }
}
