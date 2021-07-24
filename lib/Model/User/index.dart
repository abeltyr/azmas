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
  String? bio;
  @HiveField(6)
  String? gender;
  @HiveField(7)
  DateTime? birthDate;
  @HiveField(8)
  String avatar;
  @HiveField(9)
  String? instagram;
  @HiveField(10)
  String? twitter;
  @HiveField(11)
  String? telegram;
  @HiveField(12)
  String? facebook;
  @HiveField(13)
  bool? verified;
  @HiveField(14)
  bool? activated;
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
    this.bio,
    this.gender,
    this.birthDate,
    required this.avatar,
    this.instagram,
    this.twitter,
    this.telegram,
    this.facebook,
    this.verified = true,
    this.activated = true,
    this.createdAt,
    this.updatedAt,
  });
}
