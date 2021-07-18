enum GroupCategory {
  Educational,
  Friends,
  Community,
  Batch,
  Field,
  Class,
  Fun,
}

class GroupModal {
  String id;
  String title;
  String? description;
  String avatar;
  String? background;
  String? colorTheme;
  int? members;
  GroupCategory category;
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
