import 'package:azmas/Db/moorDatabase.dart';
import 'package:azmas/Providers/countDown/index.dart';
import 'package:azmas/Providers/event/index.dart';
import 'package:azmas/Providers/event/selected.dart';
import 'package:azmas/Screens/Customer/Event/EventDetail.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Shared/Card/eventCard2.dart';
import 'package:azmas/Widgets/Shared/Card/eventCardFlex.dart';
import 'package:azmas/Widgets/Shared/Card/eventCardFlex1.dart';
import 'package:azmas/Widgets/Shared/animation.dart';
import 'package:azmas/Widgets/countDown.dart';
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
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    freshEvents();
  }

  void _onRefresh() async {
    try {
      print("double here 1");
      await Future.delayed(Duration(milliseconds: 1000));
      await freshEvents();
      print("double here 2");
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  Future<void> freshEvents() async {
    try {
      await Provider.of<EventProvider>(context, listen: false).insertEvents();
    } catch (e) {
      throw "error";
    }
  }

  void _onLoading() async {
    // monitor network fetch
    print("here 1");
    await Future.delayed(Duration(milliseconds: 1000));
    print("here 2");
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    List<Event?> events = [];
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        color: Colors.transparent,
        child: StreamBuilder(
          stream:
              Provider.of<EventProvider>(context, listen: false).watchEvents(),
          builder: (context, snapData) {
            if (snapData.hasData)
              events = [null, ...snapData.data as List<Event?>, null];
            return SmartRefresher(
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
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (ctx, index) {
                  if (events[index] == null && index == 0)
                    return FutureBuilder(
                      future:
                          Provider.of<CountDownProvider>(context, listen: true)
                              .getCountDownDate(),
                      builder: (context, snapshot) {
                        Map? data = snapshot.data as Map?;
                        if (data == null)
                          return Container();
                        else
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 5,
                            ),
                            height: 250,
                            decoration: BoxDecoration(
                              color: PlatformTheme.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    top: 5,
                                  ),
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Graduation Day Count Down",
                                    style: GoogleFonts.lora(
                                      color: PlatformTheme.textColor1,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      wordSpacing: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Center(
                                  child: AnimationWidget(
                                    assetData: data["done"]
                                        ? 'assets/Animations/Confetti.json'
                                        : 'assets/Animations/Rocket.json',
                                    durationData: Duration(milliseconds: 5000),
                                  ),
                                )),
                                SizedBox(
                                  height: 15,
                                ),
                                CountDownWidget(
                                  onDone: () {
                                    Provider.of<CountDownProvider>(context,
                                            listen: false)
                                        .counterDone();
                                  },
                                  date: data["date"],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          );
                      },
                    );
                  else if (index == events.length - 1 && events[index] == null)
                    return SizedBox(
                      height: 90,
                    );
                  else if (events[index] != null) {
                    if (events[index]!.horizontal)
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: HorizontalEventCard(
                          title: events[index]!.title,
                          description: events[index]!.description,
                          eventDate: events[index]!.eventDate,
                          eventImage: events[index]!.image,
                          groupId: events[index]!.groupId,
                          location: events[index]!.location,
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
                          title: events[index]!.title,
                          description: events[index]!.description,
                          eventDate: events[index]!.eventDate,
                          eventImage: events[index]!.image,
                          groupId: events[index]!.groupId,
                          location: events[index]!.location,
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
                          title: events[index]!.title,
                          description: events[index]!.description,
                          eventDate: events[index]!.eventDate,
                          eventImage: events[index]!.image,
                          groupId: events[index]!.groupId,
                          location: events[index]!.location,
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
                  } else
                    return AnimationWidget(
                      assetData: 'assets/Animations/Loader-1.json',
                      durationData: Duration(milliseconds: 2500),
                    );
                },
              ),
            );
          },
        ));
  }
}
