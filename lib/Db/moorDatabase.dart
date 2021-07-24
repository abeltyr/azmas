import 'package:azmas/Db/migration/000-userMigration.dart';
import 'package:azmas/Db/migration/001-groupMigration.dart';
import 'package:azmas/Db/migration/002-groupMemberMigration.dart';
import 'package:azmas/Db/migration/003-eventMigration.dart';
import 'package:azmas/Db/migration/004-ticketMigration.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:moor/ffi.dart';
import 'package:path/path.dart';
import 'dart:io';

part 'moorDatabase.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, "Database.Azmas"));
    return VmDatabase(
      file,
      // logStatements: true,
    );
  });
}

@UseMoor(
  tables: [
    Users,
    Groups,
    GroupMembers,
    Events,
    Tickets,
  ],
  daos: [
    UsersDao,
    GroupsDao,
    GroupMembersDao,
    EventsDao,
    TicketsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;
}

@UseDao(
  tables: [Users],
)
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  final AppDatabase db;

  UsersDao(this.db) : super(db);

  Future<User> getUser({required String id}) async {
    var data = select(users);
    data.where((data) {
      return data.id.like(id);
    });
    return await data.getSingle();
  }

  Future insertUser(Insertable<User> track) =>
      into(users).insertOnConflictUpdate(track);

  Future updateUser(Insertable<User> track) => update(users).replace(track);

  Future deleteUser(Insertable<User> track) => delete(users).delete(track);
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
  tables: [GroupMembers],
)
class GroupMembersDao extends DatabaseAccessor<AppDatabase>
    with _$GroupMembersDaoMixin {
  final AppDatabase db;

  GroupMembersDao(this.db) : super(db);

  Future<GroupMember> getGroupMember({required String id}) async {
    var data = select(groupMembers);
    data.where((data) {
      return data.id.like(id);
    });
    return await data.getSingle();
  }

  Future<List<GroupMember>> getGroupMembers({
    required String groupId,
    int limit = 30,
    int offset = 0,
  }) async {
    var data = select(groupMembers);
    data.where((data) {
      return data.groupId.equals(groupId);
    });
    data.limit(
      limit,
      offset: offset,
    );
    return await data.get();
  }

  Future insertGroupMember(Insertable<GroupMember> track) =>
      into(groupMembers).insertOnConflictUpdate(track);

  Future updateGroupMember(Insertable<GroupMember> track) =>
      update(groupMembers).replace(track);

  Future deleteGroupMember(Insertable<GroupMember> track) =>
      delete(groupMembers).delete(track);
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

  Future<List<Event>> getEvents(
      {required DateTime startDate, required DateTime endDate}) async {
    var data = select(events);
    data.where((data) {
      return data.eventStartDate.isBetweenValues(startDate, endDate);
    });
    data.orderBy([
      (u) => OrderingTerm(expression: u.eventStartDate, mode: OrderingMode.asc),
    ]);
    return await data.get();
  }

  Stream<List<Event>> watchCalenderEvents() {
    var data = select(events);
    data.where((event) {
      return event.eventStartDate.hour
          .isBiggerOrEqualValue(DateTime.now().hour);
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
    //     final date = row.eventStartDate;
    //     return date.year.isSmallerOrEqualValue(DateTime.now().year) &
    //         date.month.isSmallerOrEqualValue(DateTime.now().month) &
    //         date.day.isSmallerOrEqualValue(DateTime.now().day);
    //   },
    // );
    data.orderBy([
      (u) => OrderingTerm(expression: u.eventStartDate, mode: OrderingMode.asc),
    ]);
    return data.watch();
  }

  Future insertEvent(Insertable<Event> track) =>
      into(events).insertOnConflictUpdate(track);

  Future updateEvent(Insertable<Event> track) => update(events).replace(track);

  Future deleteEvent(Insertable<Event> track) => delete(events).delete(track);
}

@UseDao(
  tables: [Tickets],
)
class TicketsDao extends DatabaseAccessor<AppDatabase> with _$TicketsDaoMixin {
  final AppDatabase db;

  TicketsDao(this.db) : super(db);

  Future<Ticket> getTicket({required String id}) async {
    var data = select(tickets);
    data.where((data) {
      return data.id.like(id);
    });
    return await data.getSingle();
  }

  Future<List<Ticket>> getTickets(
      {required DateTime startDate, required DateTime endDate}) async {
    var data = select(tickets);
    data.where((data) {
      return data.eventStartDate.isBetweenValues(startDate, endDate);
    });
    data.orderBy([
      (u) => OrderingTerm(expression: u.eventStartDate, mode: OrderingMode.asc),
    ]);
    return await data.get();
  }

  Stream<List<Ticket>> watchTickets(
    bool used,
  ) {
    var data = select(tickets);
    data.where((data) {
      return data.used.equals(used);
    });
    data.orderBy([
      (u) => OrderingTerm(expression: u.eventStartDate, mode: OrderingMode.asc),
    ]);
    return data.watch();
  }

  Future insertTicket(Insertable<Ticket> track) =>
      into(tickets).insertOnConflictUpdate(track);

  Future updateTicket(Insertable<Ticket> track) =>
      update(tickets).replace(track);

  Future deleteTicket(Insertable<Ticket> track) =>
      delete(tickets).delete(track);
}
