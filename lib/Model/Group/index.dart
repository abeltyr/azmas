import 'package:hive/hive.dart';

part 'index.g.dart';

@HiveType(typeId: 3)
enum GroupCategory {
  @HiveField(0)
  Educational,
  @HiveField(1)
  Friends,
  @HiveField(2)
  Community,
  @HiveField(3)
  Batch,
  @HiveField(4)
  Field,
  @HiveField(5)
  Class,
  @HiveField(6)
  Fun,
}

@HiveType(typeId: 4)
class GroupModal {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String avatar;
  @HiveField(4)
  String? background;
  @HiveField(5)
  String? colorTheme;
  @HiveField(6)
  int? members;
  @HiveField(7)
  GroupCategory category;
  @HiveField(8)
  bool public;

  GroupModal({
    required this.id,
    required this.title,
    this.description,
    this.colorTheme,
    required this.avatar,
    this.background,
    this.members,
    this.category = GroupCategory.Educational,
    this.public = true,
  });
}
