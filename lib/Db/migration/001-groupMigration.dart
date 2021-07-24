import 'package:moor/moor.dart';

class Groups extends Table {
  TextColumn get id => text()();
  TextColumn get ownerId => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get background => text()();
  TextColumn get avatar => text()();
  BoolColumn get public => boolean().withDefault(Constant(true))();
  BoolColumn get verified => boolean().withDefault(Constant(true))();
  BoolColumn get activated => boolean().withDefault(Constant(true))();
  TextColumn get category => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}
