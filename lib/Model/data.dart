class DataModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String userName;
  String avatar;
  String? background;
  String? birthDate;
  bool? active;
  String? sex;
  String? instagram;
  String? twitter;
  String? telegram;
  bool? verified;
  String? createdAt;
  String? updatedAt;

  DataModel({
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
