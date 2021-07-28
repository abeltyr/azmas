import 'package:azmas/Model/User/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'index.g.dart';

@HiveType(typeId: 4)
class GroupModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  UserModel owner;
  @HiveField(2)
  String ownerId;
  @HiveField(3)
  String title;
  @HiveField(4)
  String? description;
  @HiveField(5)
  String avatar;
  @HiveField(6)
  String background;
  @HiveField(7)
  bool public;
  @HiveField(8)
  bool verified;
  @HiveField(9)
  bool activated;
  @HiveField(10)
  String category;
  @HiveField(11)
  DateTime createdAt;
  @HiveField(12)
  DateTime updatedAt;

  GroupModel({
    required this.id,
    required this.owner,
    required this.ownerId,
    required this.title,
    this.description,
    required this.avatar,
    required this.background,
    this.public = true,
    this.verified = false,
    this.activated = true,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });
}
