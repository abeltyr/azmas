import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class SmallLoading extends StatefulWidget {
  @override
  _SmallLoadingState createState() => _SmallLoadingState();
}

class _SmallLoadingState extends State<SmallLoading>
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
    return Lottie.asset(
      'assets/Animations/Loader-1.json',
      controller: _controller,
      onLoaded: (composition) {
        // Configure the AnimationController with the duration of the
        // Lottie file and start the animation.
        _controller
          ..duration = Duration(milliseconds: 2500)
          ..repeat();
      },
    );
  }
}
