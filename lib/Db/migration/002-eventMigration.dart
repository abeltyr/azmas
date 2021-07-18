import 'package:moor/moor.dart';

class Events extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get image => text()();
  DateTimeColumn get eventDate => dateTime()();
  TextColumn get groupId => text()();
  TextColumn get category => text()();
  TextColumn get location => text()();
  IntColumn get attendees => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}
