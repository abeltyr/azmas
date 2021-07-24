import 'package:moor/moor.dart';

class GroupMembers extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get groupId => text()();
  BoolColumn get admin => boolean().withDefault(Constant(false))();
  BoolColumn get banned => boolean().withDefault(Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}
