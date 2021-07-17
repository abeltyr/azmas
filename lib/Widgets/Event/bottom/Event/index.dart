import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Event/Bottom/Event/explore.dart';
import 'package:azmas/Widgets/Event/Bottom/Event/popular.dart';
import 'package:azmas/Widgets/Event/Bottom/Event/week.dart';
import 'package:azmas/Widgets/countDown.dart';
import 'package:azmas/Widgets/loading/check.dart';
import 'package:azmas/Widgets/loading/rocket.dart';
import 'package:azmas/Widgets/loading/small.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Events extends StatefulWidget {
  final double heightData;
  Events({required this.heightData});

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 100,
      color: Colors.transparent,
      child: SmartRefresher(
          enablePullDown: true,
          header: WaterDropHeader(
            completeDuration: Duration(milliseconds: 1500),
            complete: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 30, width: 30, child: CheckLoading()),
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
            refresh: SmallLoading(),
            waterDropColor: PlatformTheme.textColor2,
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (ctx, index) {
                if (index == 0)
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                        Expanded(child: Center(child: Rocket())),
                        SizedBox(
                          height: 15,
                        ),
                        CountDownWidget(
                          date: "2021-10-17",
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  );
                else
                  return Container();
              })
          // ListView(
          //   padding: EdgeInsets.zero,
          //   children: [
          // PopularEventCards(),
          // SizedBox(height: 15),
          // WeekEventCards(),
          // SizedBox(height: 10),
          // ExploreEventCards(),
          // SizedBox(height: 90),
          // ],
          // ),
          ),

      // Container(
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height - 200,
      //   color: Colors.transparent,
      // ),
    );
  }
}
