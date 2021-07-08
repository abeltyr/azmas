import 'package:azmas/Model/group.dart';

class EventModel {
  String id;
  String title;
  String description;
  String dateTime;
  String groupId;
  GroupModal? group;
  String category;
  String place;
  int attended;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.groupId,
    required this.group,
    required this.category,
    required this.place,
    required this.attended,
  });
}
