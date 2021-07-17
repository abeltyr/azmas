import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class Rocket extends StatefulWidget {
  @override
  _RocketState createState() => _RocketState();
}

class _RocketState extends State<Rocket> with TickerProviderStateMixin {
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
    return Lottie.asset(
      'assets/Animations/Rocket.json',
      controller: _controller,
      fit: BoxFit.fill,
      onLoaded: (composition) {
        // Configure the AnimationController with the duration of the
        // Lottie file and start the animation.
        _controller
          ..duration = Duration(milliseconds: 3500)
          ..repeat();
      },
    );
  }
}
