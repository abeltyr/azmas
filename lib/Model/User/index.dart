import 'package:hive/hive.dart';

part 'index.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? fullName;
  @HiveField(2)
  String? phoneNumber;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String userName;
  @HiveField(5)
  String avatar;
  @HiveField(6)
  String? background;
  @HiveField(7)
  String? birthDate;
  @HiveField(8)
  bool? activated;
  @HiveField(9)
  String? gender;
  @HiveField(10)
  String? instagram;
  @HiveField(11)
  String? twitter;
  @HiveField(12)
  String? telegram;
  @HiveField(13)
  bool? verified;
  @HiveField(14)
  String? description;
  @HiveField(15)
  DateTime? createdAt;
  @HiveField(16)
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    required this.userName,
    required this.avatar,
    this.background,
    this.birthDate,
    this.activated = true,
    this.gender,
    this.instagram,
    this.twitter,
    this.telegram,
    this.verified = true,
    this.description,
    this.createdAt,
    this.updatedAt,
  });
}
