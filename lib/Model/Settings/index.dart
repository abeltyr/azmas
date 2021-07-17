import 'package:hive/hive.dart';

part 'index.g.dart';

@HiveType(typeId: 2)
class SettingModel {
  @HiveField(0)
  bool? darkTheme;
  bool? intro;

  SettingModel({
    this.darkTheme = false,
    this.intro = true,
  });
}
