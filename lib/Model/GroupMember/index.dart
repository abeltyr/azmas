import 'package:azmas/Model/Group/index.dart';
import 'package:azmas/Model/User/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'index.g.dart';

@HiveType(typeId: 5)
class GroupMemberModel {
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
  bool banned;
  @HiveField(6)
  bool admin;
  @HiveField(7)
  DateTime createdAt;
  @HiveField(8)
  DateTime updatedAt;

  GroupMemberModel({
    required this.id,
    required this.user,
    required this.userId,
    required this.group,
    required this.groupId,
    this.banned = false,
    this.admin = false,
    required this.createdAt,
    required this.updatedAt,
  });
}
