import 'package:azmas/Model/Event/index.dart';
import 'package:azmas/Model/Group/index.dart';
import 'package:azmas/Model/User/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'index.g.dart';

@HiveType(typeId: 5)
class TicketModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  UserModel user;
  @HiveField(2)
  String userId;
  @HiveField(3)
  GroupModel group;
  @HiveField(4)
  String groupId;
  @HiveField(5)
  EventModel event;
  @HiveField(6)
  String eventId;
  @HiveField(7)
  DateTime eventStartDate;
  @HiveField(8)
  DateTime eventEndDate;
  @HiveField(9)
  double price;
  @HiveField(10)
  bool used;
  @HiveField(11)
  DateTime createdAt;
  @HiveField(12)
  DateTime updatedAt;

  TicketModel({
    required this.id,
    required this.user,
    required this.userId,
    required this.group,
    required this.groupId,
    required this.event,
    required this.eventId,
    required this.eventStartDate,
    required this.eventEndDate,
    this.used = false,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });
}
