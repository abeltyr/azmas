import 'package:azmas/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SaveWidget extends StatefulWidget {
  final bool saved;
  const SaveWidget({this.saved = false});

  @override
  _SaveWidgetState createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveWidget> with TickerProviderStateMixin {
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
    return GestureDetector(
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
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 30,
            width: 30,
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
        ],
      ),
    );
  }
}
