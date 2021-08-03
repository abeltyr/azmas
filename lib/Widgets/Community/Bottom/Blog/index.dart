import 'package:azmas/Providers/interaction/communityScreen.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Community/CardDetail/postCard.dart';
import 'package:azmas/Widgets/Shared/animation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  bool loading = true;
  bool error = true;
  bool loadmore = false;

  late RefreshController _refreshController;
  @override
  void initState() {
    super.initState();
    final communityProvider =
        Provider.of<CommunityInteractionProvider>(context, listen: false);
    _refreshController = RefreshController(
      initialRefresh: communityProvider.selectedTab == 2,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onRefresh() async {
    try {
      if (error)
        setState(() {
          loading = true;
        });
      await Future.delayed(Duration(milliseconds: 2000));
      // final eventsData =
      //     await Provider.of<EventProvider>(context, listen: false).fetchEvent(
      //   skip: 0,
      //   take: 4,
      // );
      // events = [...eventsData!];
      // for (var event in eventsData) {
      //   if (event.horizontal)
      //     height = height + 163.5;
      //   else
      //     height = height + 417.5;
      // }
      if (mounted)
        setState(() {
          loading = false;
          error = false;
          loadmore = true;
        });
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
      setState(() {
        // events = [];
        error = true;
        loading = false;
      });
    }
  }

  void _onLoading() async {
    try {
      await Future.delayed(Duration(milliseconds: 1000));
      // final eventsData =
      //     await Provider.of<EventProvider>(context, listen: false).fetchEvent(
      //   skip: events.length,
      //   take: 4,
      // );
      // events = [...events, ...eventsData!];
      // height = 0;
      // for (var event in events) {
      //   if (event.horizontal)
      //     height = height + 163.5;
      //   else
      //     height = height + 417.5;
      //   print("height, $height");
      // }
      // if (mounted)
      //   setState(() {
      //     loadmore = eventsData.length == 0 ? false : true;
      //   });
      _refreshController.loadComplete();
    } catch (e) {
      _refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 85,
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: loadmore,
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
          padding: EdgeInsets.zero,
          itemCount: 20,
          itemBuilder: (ctx, index) {
            return PostCard(
              readTime: "4 min",
              image: "https://source.unsplash.com/1600x900/?nature",
              avatar: "https://source.unsplash.com/1600x900/?nature",
              title: "Lorem Ipsum is simply dummy text of the printing and ",
              communityName: "Azmas",
              postTime: DateTime.parse("2021-08-04"),
              poster: "Abel",
              detail:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularized in the 1960s with the release of Leeriest sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Lauds PageMaker including versions of Lorem Ipsum.",
            );
          },
        ),
      ),
    );
  }
}
