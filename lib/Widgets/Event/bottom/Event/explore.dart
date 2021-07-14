import 'package:azmas/Model/event.dart';
import 'package:azmas/Providers/event/index.dart';
import 'package:azmas/Providers/event/selected.dart';
import 'package:azmas/Screens/Customer/Event/EventDetail.dart';
import 'package:azmas/Widgets/Shared/Card/eventCard2.dart';
import 'package:flutter/material.dart';
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
    _future =
        Provider.of<EventProvider>(context, listen: false).getExploreEvents;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future(),
        builder: (context, snapshot) {
          final List<EventModel>? events = snapshot.data as List<EventModel>?;
          if (snapshot.hasData && snapshot.data != null)
            return Container(
              height: events!.length * 160,
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
                    child: EventCardWidget2(
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
