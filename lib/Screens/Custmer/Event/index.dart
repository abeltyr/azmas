import 'package:azmas/Utils/theme.dart';
import 'package:azmas/Widgets/Event/top/index.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PlatformTheme.primaryColor,
      body: Column(
        children: [
          EventTop(),
        ],
      ),
    );
  }
}
