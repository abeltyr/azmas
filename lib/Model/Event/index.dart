import 'package:azmas/Model/Community/index.dart';
import 'package:azmas/Model/User/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'index.g.dart';

@HiveType(typeId: 4)
class EventModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  UserModel? user;
  @HiveField(2)
  String creatorId;
  @HiveField(3)
  CommunityModel? community;
  @HiveField(4)
  String communityId;
  @HiveField(5)
  String title;
  @HiveField(6)
  String? description;
  @HiveField(7)
  String image;
  @HiveField(8)
  String category;
  @HiveField(9)
  bool horizontal;
  @HiveField(10)
  DateTime eventStartDate;
  @HiveField(11)
  DateTime eventEndDate;
  @HiveField(12)
  String location;
  @HiveField(13)
  double price;
  @HiveField(14)
  DateTime createdAt;
  @HiveField(15)
  DateTime updatedAt;

  EventModel({
    required this.id,
    required this.user,
    required this.creatorId,
    required this.community,
    required this.communityId,
    required this.title,
    this.description,
    required this.image,
    required this.category,
    this.horizontal = true,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.location,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });
}
