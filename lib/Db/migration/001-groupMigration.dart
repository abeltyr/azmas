import 'package:moor/moor.dart';

class Groups extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get avatar => text()();
  TextColumn get background => text()();
  TextColumn get colorTheme => text()();
  IntColumn get members => integer().withDefault(const Constant(0))();
  TextColumn get category => text()();
  BoolColumn get public => boolean().withDefault(Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}
