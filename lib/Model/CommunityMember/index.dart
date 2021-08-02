import 'package:azmas/Model/Community/index.dart';
import 'package:azmas/Model/User/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'index.g.dart';

@HiveType(typeId: 3)
class CommunityMemberModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  UserModel user;
  @HiveField(2)
  String userId;
  @HiveField(3)
  CommunityModel community;
  @HiveField(4)
  String communityId;
  @HiveField(5)
  bool banned;
  @HiveField(6)
  bool admin;
  @HiveField(7)
  DateTime createdAt;
  @HiveField(8)
  DateTime updatedAt;

  CommunityMemberModel({
    required this.id,
    required this.user,
    required this.userId,
    required this.community,
    required this.communityId,
    this.banned = false,
    this.admin = false,
    required this.createdAt,
    required this.updatedAt,
  });
}
