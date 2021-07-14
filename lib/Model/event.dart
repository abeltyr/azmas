import 'package:azmas/Model/group.dart';

enum EventCategory {
  Education,
  GetTogether,
  SchoolEvent,
  Party,
  Seminars,
  Fun,
}

class EventModel {
  String id;
  String title;
  String description;
  String image;
  String dateTime;
  String groupId;
  GroupModal? group;
  EventCategory category;
  String location;
  int? attended;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.dateTime,
    required this.groupId,
    required this.group,
    required this.category,
    required this.location,
    this.attended,
  });
}
