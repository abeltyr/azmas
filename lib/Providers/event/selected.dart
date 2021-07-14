import 'package:azmas/Model/event.dart';
import 'package:azmas/Model/group.dart';
import 'package:flutter/foundation.dart';

class EventSelectedProvider with ChangeNotifier {
  EventModel? _event = EventModel(
    id: "1",
    groupId: "groupId",
    category: EventCategory.GetTogether,
    title:
        "Title orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard d",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    dateTime: "2020-07-07",
    image:
        "https://images.unsplash.com/photo-1483921020237-2ff51e8e4b22?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
    group: GroupModal(
      id: "1",
      avatar:
          "https://images.unsplash.com/photo-1626019082887-900b630b9fd9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1789&q=80",
      title: "Group Name",
    ),
    location: "Some Where in AAST AASTU sda hguihjh hjghj jh hjh gj",
  );

  EventModel? get event {
    return _event;
  }

  Future<void> selectEvent({
    required EventModel eventData,
  }) async {
    _event = eventData;
    notifyListeners();
  }
}
