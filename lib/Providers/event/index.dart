import 'package:azmas/Model/event.dart';
import 'package:azmas/Model/group.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
  List<EventModel> _events = [];
  final imageData =
      "https://images.unsplash.com/photo-1625247666944-c93f0ee3da9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1790&q=80";

  List<EventModel> get events {
    return _events;
  }

  Future<List<EventModel>> getEvents() async {
    _events = [
      EventModel(
        id: "1",
        groupId: "groupId",
        category: EventCategory.GetTogether,
        title: "Title Ipsum is simply d",
        description: "Lorem  PageMaker including versions of Lorem Ipsum.",
        dateTime: "2021-09-07",
        image: imageData,
        group: GroupModal(
          id: "1",
          avatar:
              "https://images.unsplash.com/photo-1626019082887-900b630b9fd9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1789&q=80",
          title: "Group Name data",
        ),
        location: "Some Where in AASTU",
      ),
      EventModel(
        id: "2",
        groupId: "groupId",
        category: EventCategory.GetTogether,
        title: "Title orem Ipsum is simply d",
        description:
            "Lorem Irinter took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        dateTime: "2021-09-07",
        image: imageData,
        group: GroupModal(
          id: "1",
          avatar:
              "https://images.unsplash.com/photo-1626019082887-900b630b9fd9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1789&q=80",
          title: "Group Name",
        ),
        location: "Some Where Outside AASTU",
      ),
      EventModel(
        id: "3",
        groupId: "groupId",
        category: EventCategory.GetTogether,
        title: "Title ",
        description:
            "Lorem Irinter took a lso the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        dateTime: "2021-09-07",
        image: imageData,
        group: GroupModal(
          id: "1",
          avatar:
              "https://images.unsplash.com/photo-1626019082887-900b630b9fd9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1789&q=80",
          title: "Group Name",
        ),
        location: "Anywhere Where Outside AASTU",
      ),
      EventModel(
        id: "3",
        groupId: "groupId",
        category: EventCategory.GetTogether,
        title:
            "Title Lorem Irinter took a lso the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu",
        description:
            "Lorem Irinter tookLorem Irinter took a lso the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu a lso the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        dateTime: "2021-09-07",
        image: imageData,
        group: GroupModal(
          id: "1",
          avatar:
              "https://images.unsplash.com/photo-1626019082887-900b630b9fd9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1789&q=80",
          title: "Group Name",
        ),
        location:
            "Anywhere Where Outside AASTU Lorem Irinter took a lso the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu",
      ),
      EventModel(
        id: "4",
        groupId: "groupId",
        category: EventCategory.GetTogether,
        title: "Title Lorem Irinter took a lso theem Ipsu",
        description:
            "Lorem Irinter tookLorem Irinter took a lso the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu a lso the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        dateTime: "2021-09-07",
        image: imageData,
        group: GroupModal(
          id: "1",
          avatar:
              "https://images.unsplash.com/photo-1626019082887-900b630b9fd9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1789&q=80",
          title: "Group Name",
        ),
        location:
            "Anywhere Where Outside AASTU Lorem Irinter took a lso the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu",
      ),
    ];
    return _events;
  }
}
