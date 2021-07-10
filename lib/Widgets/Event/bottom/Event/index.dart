import 'package:azmas/Model/group.dart';
import 'package:azmas/Widgets/Shared/Card/event.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  final double heightData;
  Events({required this.heightData});
  final imageData =
      "https://images.unsplash.com/photo-1479669732031-affb2ce2d265?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1778&q=80";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightData,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          EventCard(
            title: "Title",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            date: "2020-07-07",
            eventImage: imageData,
            group: GroupModal(
              id: "1",
              avatar: imageData,
              title: "Group Name",
            ),
            location:
                "Some Where in AASTU sda hguihjh hjghj jh hjh  in AASTU sda hguiguihjh hjghj jh hjh  in AASTU sda hguihjh hjghj jh hjh gj",
          ),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
