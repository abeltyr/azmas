import 'package:flutter/foundation.dart';

class GroupModal {
  String id;
  String title;
  String description;
  String avatar;
  String background;
  int members;
  String category;
  bool public;

  GroupModal({
    required this.id,
    required this.title,
    required this.description,
    required this.avatar,
    required this.background,
    required this.members,
    required this.category,
    this.public = true,
  });
}
