import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? phoneNumber;
  @HiveField(4)
  String? email;
  @HiveField(5)
  String userName;
  @HiveField(6)
  String avatar;
  @HiveField(7)
  String? background;
  @HiveField(8)
  String? birthDate;
  @HiveField(9)
  bool? active;
  @HiveField(10)
  String? sex;
  @HiveField(11)
  String? instagram;
  @HiveField(12)
  String? twitter;
  @HiveField(13)
  String? telegram;
  @HiveField(14)
  bool? verified;
  @HiveField(15)
  String? createdAt;
  @HiveField(16)
  String? updatedAt;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    required this.userName,
    required this.avatar,
    this.background,
    this.birthDate,
    this.active = true,
    this.sex,
    this.instagram,
    this.twitter,
    this.telegram,
    this.verified = true,
    this.createdAt,
    this.updatedAt,
  });
}
