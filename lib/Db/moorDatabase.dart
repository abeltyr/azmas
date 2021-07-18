import 'package:azmas/Db/migration/001-groupMigration.dart';
import 'package:azmas/Db/migration/002-eventMigration.dart';
import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moor/ffi.dart';
import 'package:path/path.dart';
import 'dart:io';

part 'moorDatabase.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, "Database.AWTAR"));
    return VmDatabase(
      file,
      // logStatements: true,
    );
  });
}

@UseMoor(
  tables: [
    Groups,
    Events,
  ],
  daos: [
    GroupsDao,
    EventsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;
}

@UseDao(
  tables: [Groups],
)
class GroupsDao extends DatabaseAccessor<AppDatabase> with _$GroupsDaoMixin {
  final AppDatabase db;

  GroupsDao(this.db) : super(db);

  Future<Group> getGroup({required String id}) async {
    var data = select(groups);
    data.where((data) {
      return data.id.like(id);
    });
    return await data.getSingle();
  }

  Future<List<Group>> getGroups({
    int limit = 30,
    int offset = 0,
  }) async {
    var data = select(groups);
    data.limit(
      limit,
      offset: offset,
    );
    return await data.get();
  }

  Future insertGroup(Insertable<Group> track) =>
      into(groups).insertOnConflictUpdate(track);

  Future updateGroup(Insertable<Group> track) => update(groups).replace(track);

  Future deleteGroup(Insertable<Group> track) => delete(groups).delete(track);
}

@UseDao(
  tables: [Events],
)
class EventsDao extends DatabaseAccessor<AppDatabase> with _$EventsDaoMixin {
  final AppDatabase db;

  EventsDao(this.db) : super(db);

  Future<Event> getEvent({required String id}) async {
    var data = select(events);
    data.where((data) {
      return data.id.like(id);
    });
    return await data.getSingle();
  }

  Future<List<Event>> getEvents({
    int limit = 30,
    int offset = 0,
  }) async {
    var data = select(events);
    data.limit(
      limit,
      offset: offset,
    );
    return await data.get();
  }

  Stream<List<Event>> watchCalenderEvents() {
    var data = select(events);
    data.where((event) {
      return event.eventDate.hour.isBiggerOrEqualValue(DateTime.now().hour);
    });
    data.orderBy([
      (u) => OrderingTerm(expression: u.updatedAt, mode: OrderingMode.asc),
    ]);
    return data.watch();
  }

  Stream<List<Event>> watchEvents() {
    var data = select(events);
    // data.where(
    //   (row) {
    //     final date = row.eventDate;
    //     return date.year.isSmallerOrEqualValue(DateTime.now().year) &
    //         date.month.isSmallerOrEqualValue(DateTime.now().month) &
    //         date.day.isSmallerOrEqualValue(DateTime.now().day);
    //   },
    // );
    data.orderBy([
      (u) => OrderingTerm(expression: u.eventDate, mode: OrderingMode.asc),
    ]);
    return data.watch();
  }

  Future insertEvent(Insertable<Event> track) =>
      into(events).insertOnConflictUpdate(track);

  Future updateEvent(Insertable<Event> track) => update(events).replace(track);

  Future deleteEvent(Insertable<Event> track) => delete(events).delete(track);
}
