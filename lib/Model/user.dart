class UserModel {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String avatar;
  String? background;
  DateTime? birthDate;
  bool person;
  String account;
  double? balance;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    required this.avatar,
    this.birthDate,
    this.person = true,
    this.account = "**2289",
    this.balance,
  });
}
