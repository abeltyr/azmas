import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class CheckLoading extends StatefulWidget {
  @override
  _CheckLoadingState createState() => _CheckLoadingState();
}

class _CheckLoadingState extends State<CheckLoading>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    // _controller
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/Animations/CheckMark.json',
      controller: _controller,
      onLoaded: (composition) {
        // Configure the AnimationController with the duration of the
        // Lottie file and start the animation.
        _controller
          ..duration = Duration(milliseconds: 350)
          ..forward();
      },
    );
  }
}
