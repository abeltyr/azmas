import 'package:moor/moor.dart';

class Tickets extends Table {
  TextColumn get id => text()();
  TextColumn get groupId => text()();
  TextColumn get eventId => text()();
  TextColumn get userId => text()();
  DateTimeColumn get eventStartDate => dateTime()();
  DateTimeColumn get eventEndDate => dateTime()();
  RealColumn get price => real().clientDefault(() => 0)();
  BoolColumn get used => boolean().withDefault(Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}
