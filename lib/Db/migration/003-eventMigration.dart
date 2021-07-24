import 'package:moor/moor.dart';

class Events extends Table {
  TextColumn get id => text()();
  TextColumn get groupId => text()();
  TextColumn get creatorId => text().nullable()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get image => text()();
  BoolColumn get horizontal => boolean().withDefault(Constant(true))();
  DateTimeColumn get eventStartDate => dateTime()();
  DateTimeColumn get eventEndDate => dateTime()();
  TextColumn get category => text()();
  TextColumn get location => text()();
  RealColumn get price => real().clientDefault(() => 0)();
  IntColumn get attendees => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}
