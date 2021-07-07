import 'package:azmas/Providers/interaction/eventScreen.dart';
import 'package:azmas/Utils/inputTheme.dart';
import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({Key? key}) : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(milliseconds: 150);
    _searchController = new TextEditingController(text: "");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        _controller.reset();
        if (!eventProvider.searchTap)
          _controller.forward();
        else if (eventProvider.searchTap) _controller.reverse();
        eventProvider.updateSearchTap(!eventProvider.searchTap);
      },
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 150,
        ),
        width: eventProvider.searchTap
            ? MediaQuery.of(context).size.width - 30
            : 60,
        height: !eventProvider.searchTap ? 55 : 50,
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: PlatformTheme.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              alignment: eventProvider.searchTap
                  ? Alignment.bottomLeft
                  : Alignment.center,
              child: Lottie.asset(
                'assets/Animations/SearchToX.json',
                width: !eventProvider.searchTap ? 40 : 30,
                height: !eventProvider.searchTap ? 40 : 30,
                controller: _controller,
                onLoaded: (composition) {
                  // Configure the AnimationController with the duration of the
                  // Lottie file and start the animation.
                  _controller..duration = Duration(milliseconds: 350);
                },
              ),
            ),
            if (eventProvider.searchTap)
              Container(
                margin: EdgeInsets.only(
                  left: 40,
                ),
                width: double.infinity,
                child: TextField(
                  controller: _searchController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.go,
                  maxLines: 1,
                  autofocus: true,
                  enableSuggestions: true,
                  autocorrect: true,
                  style: GoogleFonts.lora(
                    color: PlatformTheme.secondaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    wordSpacing: 0.1,
                  ),
                  cursorColor: PlatformTheme.secondaryColor,
                  decoration: InputTheme().textDecoration(label: "Search"),
                  onSubmitted: (value) {
                    print("search");
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
