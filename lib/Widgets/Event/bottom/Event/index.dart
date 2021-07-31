import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Providers/event/index.dart';
import 'package:azmas/Providers/event/selected.dart';
import 'package:azmas/Screens/Customer/Event/EventDetail.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Event/countDown.dart';
import 'package:azmas/Widgets/Shared/Card/horizontalEventCard.dart';
import 'package:azmas/Widgets/Shared/Card/eventCardFlex.dart';
import 'package:azmas/Widgets/Shared/Card/eventCardFlex1.dart';
import 'package:azmas/Widgets/Shared/Loading/eventCardLoading.dart';
import 'package:azmas/Widgets/Shared/Loading/horizontalCard.dart';
import 'package:azmas/Widgets/Shared/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EventLists extends StatefulWidget {
  @override
  _EventListsState createState() => _EventListsState();
}

class _EventListsState extends State<EventLists> {
  List<EventModel> events = [];
  double height = 0;
  bool loading = true;

  RefreshController _refreshController = RefreshController(
    initialRefresh: true,
  );

  @override
  void initState() {
    height = 0;
    super.initState();
  }

  @override
  void dispose() {
    height = 0;
    super.dispose();
  }

  void _onRefresh() async {
    try {
      print("double here 1");
      await Future.delayed(Duration(milliseconds: 2000));
      final eventsData =
          await Provider.of<EventProvider>(context, listen: false).fetchEvent(
        skip: 0,
        take: 4,
      );
      height = 0;
      events = [...eventsData!];
      for (var event in eventsData) {
        if (event.horizontal)
          height = height + 163.5;
        else
          height = height + 417.5;
        print("height, $height");
      }
      if (mounted)
        setState(() {
          events = events;
          loading = false;
        });
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  void _onLoading() async {
    try {
      await Future.delayed(Duration(milliseconds: 1000));
      final eventsData =
          await Provider.of<EventProvider>(context, listen: false).fetchEvent(
        skip: events.length,
        take: 4,
      );
      events = [...events, ...eventsData!];
      height = 0;
      for (var event in events) {
        if (event.horizontal)
          height = height + 163.5;
        else
          height = height + 417.5;
        print("height, $height");
      }
      if (mounted)
        setState(() {
          events = events;
        });
      _refreshController.loadComplete();
    } catch (e) {
      _refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 100,
      color: Colors.transparent,
      padding: EdgeInsets.only(
        bottom: 50,
      ),
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(
          completeDuration: Duration(milliseconds: 1500),
          complete: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 30,
                  width: 30,
                  child: AnimationWidget(
                    repeat: false,
                    assetData: 'assets/Animations/CheckMark.json',
                    durationData: Duration(milliseconds: 350),
                  )),
              Text(
                "Fetched All The Events",
                style: GoogleFonts.lora(
                  color: PlatformTheme.textColor2,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  wordSpacing: 0.5,
                ),
              ),
            ],
          )),
          failed: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                child: AnimationWidget(
                  assetData: 'assets/Animations/Error.json',
                  durationData: Duration(milliseconds: 150),
                ),
              ),
              Text(
                "Something Went Wrong.",
                style: GoogleFonts.lora(
                  color: PlatformTheme.textColor2,
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  wordSpacing: 0.5,
                ),
              ),
            ],
          )),
          refresh: AnimationWidget(
            assetData: 'assets/Animations/Loader-1.json',
            durationData: Duration(milliseconds: 2500),
          ),
          waterDropColor: PlatformTheme.textColor2,
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView(
          children: [
            EventCountDown(),
            if (events.length == 0 && !loading)
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    AnimationWidget(
                      assetData: 'assets/Animations/Empty.json',
                    ),
                    Text(
                      "No Event Was found. \nPull Down to fetch new events",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lora(
                        color: PlatformTheme.textColor2,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        wordSpacing: 0.1,
                      ),
                    ),
                  ],
                ),
              )
            else if (events.length == 0 && loading)
              Container(
                height: 520,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(height: 150, child: HorizontalCardLoading()),
                    SizedBox(
                      height: 15,
                    ),
                    Container(height: 330, child: EventCardFlexLoading()),
                  ],
                ),
              )
            else
              Container(
                height: height,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: events.length,
                  itemBuilder: (ctx, index) {
                    if (events[index].horizontal)
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: HorizontalEventCard(
                          title: events[index].title,
                          group: events[index].group,
                          description: events[index].description,
                          eventStartDate: events[index].eventStartDate,
                          eventImage: events[index].image,
                          groupId: events[index].groupId,
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
                    else if (index % 2 == 0)
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: EventCardFlexWidget(
                          group: events[index].group,
                          title: events[index].title,
                          description: events[index].description,
                          eventStartDate: events[index].eventStartDate,
                          eventImage: events[index].image,
                          groupId: events[index].groupId,
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
                    else
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: EventCardFlex1Widget(
                          group: events[index].group,
                          title: events[index].title,
                          description: events[index].description,
                          eventStartDate: events[index].eventStartDate,
                          eventImage: events[index].image,
                          groupId: events[index].groupId,
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
              ),
          ],
        ),
      ),
    );
  }
}
