import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CommunityDetail extends StatefulWidget {
  final bool saved;
  const CommunityDetail({this.saved = false});

  @override
  _CommunityDetailState createState() => _CommunityDetailState();
}

class _CommunityDetailState extends State<CommunityDetail>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool savedData = widget.saved;
    return Container(
      height: 35,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 25,
                height: 25,
                child: SvgPicture.asset(
                  "assets/Icons/Broken/Chat.svg",
                  color: PlatformTheme.darkPrimaryColorLight,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "100 K",
                style: GoogleFonts.lora(
                  color: PlatformTheme.darkPrimaryColorLight,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  wordSpacing: 1,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              if (!savedData) {
                _controller.forward();
                savedData = true;
              } else {
                _controller.reset();
                savedData = false;
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 27.5,
                  width: 27.5,
                  child: Lottie.asset(
                    'assets/Animations/Bookmark.json',
                    controller: _controller,
                    onLoaded: (composition) {
                      // Configure the AnimationController with the duration of the
                      // Lottie file and start the animation.
                      _controller..duration = const Duration(milliseconds: 250);
                    },
                  ),
                ),
                Text(
                  "Save",
                  style: GoogleFonts.lora(
                    color: PlatformTheme.darkPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    wordSpacing: 1,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
