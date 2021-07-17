import 'package:hive/hive.dart';
import 'package:azmas/Model/Group/index.dart';

part 'index.g.dart';

@HiveType(typeId: 5)
enum EventCategory {
  @HiveField(0)
  Education,
  @HiveField(1)
  GetTogether,
  @HiveField(2)
  SchoolEvent,
  @HiveField(3)
  Party,
  @HiveField(4)
  Seminars,
  @HiveField(5)
  Fun,
}

@HiveType(typeId: 6)
class EventModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  String image;
  @HiveField(4)
  String dateTime;
  @HiveField(5)
  String groupId;
  @HiveField(6)
  GroupModal? group;
  @HiveField(7)
  EventCategory category;
  @HiveField(8)
  String location;
  @HiveField(9)
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
