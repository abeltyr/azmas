import 'package:moor/moor.dart';

class Users extends Table {
  TextColumn get id => text()();
  TextColumn get fullName => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get email => text()();
  TextColumn get userName => text()();
  TextColumn get bio => text().nullable()();
  TextColumn get gender => text()();
  DateTimeColumn get birthDate => dateTime()();
  TextColumn get instagram => text().nullable()();
  TextColumn get twitter => text().nullable()();
  TextColumn get telegram => text().nullable()();
  TextColumn get facebook => text().nullable()();
  BoolColumn get verified => boolean().withDefault(Constant(true))();
  BoolColumn get activated => boolean().withDefault(Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}
