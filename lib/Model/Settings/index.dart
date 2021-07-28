import 'package:hive/hive.dart';

part 'index.g.dart';

@HiveType(typeId: 0)
class SettingModel {
  @HiveField(0)
  bool intro;

  SettingModel({
    this.intro = true,
  });
}
