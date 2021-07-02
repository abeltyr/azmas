import 'package:azmas/Widgets/Shared/top.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopBarWidget(
            title: "Activity",
          ),
          Container(
            height: MediaQuery.of(context).size.height - 90,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                child: Text("data"),
              );
            }),
          )
        ],
      ),
    );
  }
}
