import 'package:azmas/Model/event.dart';
import 'package:azmas/Providers/event/index.dart';
import 'package:azmas/Providers/event/selected.dart';
import 'package:azmas/Screens/Customer/Event/EventDetail.dart';
import 'package:azmas/Widgets/Shared/Card/eventCard3.dart';
import 'package:flutter/material.dart';
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
    _future = Provider.of<EventProvider>(context, listen: false).getWeekEvents;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future(),
        builder: (context, snapshot) {
          final List<EventModel>? events = snapshot.data as List<EventModel>?;
          if (snapshot.hasData && snapshot.data != null)
            return Container(
              height: 335,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: events!.length,
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
                        final eventProvider =
                            Provider.of<EventSelectedProvider>(context,
                                listen: false);
                        eventProvider.selectEvent(eventData: events[index]);
                        Navigator.pushNamed(
                            context, EventDetailScreen.routeName);
                      },
                    ),
                  );
                },
              ),
            );
          else
            return Container(
              height: 335,
              width: MediaQuery.of(context).size.width,
            );
        });
  }
}
