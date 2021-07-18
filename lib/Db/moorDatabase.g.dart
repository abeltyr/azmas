// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moorDatabase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Group extends DataClass implements Insertable<Group> {
  final String id;
  final String title;
  final String description;
  final String avatar;
  final String background;
  final String colorTheme;
  final int members;
  final String category;
  final bool public;
  final DateTime createdAt;
  final DateTime updatedAt;
  Group(
      {required this.id,
      required this.title,
      required this.description,
      required this.avatar,
      required this.background,
      required this.colorTheme,
      required this.members,
      required this.category,
      required this.public,
      required this.createdAt,
      required this.updatedAt});
  factory Group.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Group(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar'])!,
      background: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}background'])!,
      colorTheme: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color_theme'])!,
      members: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}members'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      public: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}public'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['avatar'] = Variable<String>(avatar);
    map['background'] = Variable<String>(background);
    map['color_theme'] = Variable<String>(colorTheme);
    map['members'] = Variable<int>(members);
    map['category'] = Variable<String>(category);
    map['public'] = Variable<bool>(public);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      avatar: Value(avatar),
      background: Value(background),
      colorTheme: Value(colorTheme),
      members: Value(members),
      category: Value(category),
      public: Value(public),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Group.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Group(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      avatar: serializer.fromJson<String>(json['avatar']),
      background: serializer.fromJson<String>(json['background']),
      colorTheme: serializer.fromJson<String>(json['colorTheme']),
      members: serializer.fromJson<int>(json['members']),
      category: serializer.fromJson<String>(json['category']),
      public: serializer.fromJson<bool>(json['public']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'avatar': serializer.toJson<String>(avatar),
      'background': serializer.toJson<String>(background),
      'colorTheme': serializer.toJson<String>(colorTheme),
      'members': serializer.toJson<int>(members),
      'category': serializer.toJson<String>(category),
      'public': serializer.toJson<bool>(public),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Group copyWith(
          {String? id,
          String? title,
          String? description,
          String? avatar,
          String? background,
          String? colorTheme,
          int? members,
          String? category,
          bool? public,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Group(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        avatar: avatar ?? this.avatar,
        background: background ?? this.background,
        colorTheme: colorTheme ?? this.colorTheme,
        members: members ?? this.members,
        category: category ?? this.category,
        public: public ?? this.public,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Group(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('avatar: $avatar, ')
          ..write('background: $background, ')
          ..write('colorTheme: $colorTheme, ')
          ..write('members: $members, ')
          ..write('category: $category, ')
          ..write('public: $public, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  avatar.hashCode,
                  $mrjc(
                      background.hashCode,
                      $mrjc(
                          colorTheme.hashCode,
                          $mrjc(
                              members.hashCode,
                              $mrjc(
                                  category.hashCode,
                                  $mrjc(
                                      public.hashCode,
                                      $mrjc(createdAt.hashCode,
                                          updatedAt.hashCode)))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Group &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.avatar == this.avatar &&
          other.background == this.background &&
          other.colorTheme == this.colorTheme &&
          other.members == this.members &&
          other.category == this.category &&
          other.public == this.public &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> avatar;
  final Value<String> background;
  final Value<String> colorTheme;
  final Value<int> members;
  final Value<String> category;
  final Value<bool> public;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.avatar = const Value.absent(),
    this.background = const Value.absent(),
    this.colorTheme = const Value.absent(),
    this.members = const Value.absent(),
    this.category = const Value.absent(),
    this.public = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GroupsCompanion.insert({
    required String id,
    required String title,
    required String description,
    required String avatar,
    required String background,
    required String colorTheme,
    this.members = const Value.absent(),
    required String category,
    this.public = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        avatar = Value(avatar),
        background = Value(background),
        colorTheme = Value(colorTheme),
        category = Value(category),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Group> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? avatar,
    Expression<String>? background,
    Expression<String>? colorTheme,
    Expression<int>? members,
    Expression<String>? category,
    Expression<bool>? public,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (avatar != null) 'avatar': avatar,
      if (background != null) 'background': background,
      if (colorTheme != null) 'color_theme': colorTheme,
      if (members != null) 'members': members,
      if (category != null) 'category': category,
      if (public != null) 'public': public,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GroupsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? avatar,
      Value<String>? background,
      Value<String>? colorTheme,
      Value<int>? members,
      Value<String>? category,
      Value<bool>? public,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return GroupsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      background: background ?? this.background,
      colorTheme: colorTheme ?? this.colorTheme,
      members: members ?? this.members,
      category: category ?? this.category,
      public: public ?? this.public,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (background.present) {
      map['background'] = Variable<String>(background.value);
    }
    if (colorTheme.present) {
      map['color_theme'] = Variable<String>(colorTheme.value);
    }
    if (members.present) {
      map['members'] = Variable<int>(members.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (public.present) {
      map['public'] = Variable<bool>(public.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('avatar: $avatar, ')
          ..write('background: $background, ')
          ..write('colorTheme: $colorTheme, ')
          ..write('members: $members, ')
          ..write('category: $category, ')
          ..write('public: $public, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GroupsTable extends Groups with TableInfo<$GroupsTable, Group> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GroupsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _backgroundMeta = const VerificationMeta('background');
  late final GeneratedColumn<String?> background = GeneratedColumn<String?>(
      'background', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _colorThemeMeta = const VerificationMeta('colorTheme');
  late final GeneratedColumn<String?> colorTheme = GeneratedColumn<String?>(
      'color_theme', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _membersMeta = const VerificationMeta('members');
  late final GeneratedColumn<int?> members = GeneratedColumn<int?>(
      'members', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _publicMeta = const VerificationMeta('public');
  late final GeneratedColumn<bool?> public = GeneratedColumn<bool?>(
      'public', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (public IN (0, 1))',
      defaultValue: Constant(true));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        avatar,
        background,
        colorTheme,
        members,
        category,
        public,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? '"groups"';
  @override
  String get actualTableName => '"groups"';
  @override
  VerificationContext validateIntegrity(Insertable<Group> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    if (data.containsKey('background')) {
      context.handle(
          _backgroundMeta,
          background.isAcceptableOrUnknown(
              data['background']!, _backgroundMeta));
    } else if (isInserting) {
      context.missing(_backgroundMeta);
    }
    if (data.containsKey('color_theme')) {
      context.handle(
          _colorThemeMeta,
          colorTheme.isAcceptableOrUnknown(
              data['color_theme']!, _colorThemeMeta));
    } else if (isInserting) {
      context.missing(_colorThemeMeta);
    }
    if (data.containsKey('members')) {
      context.handle(_membersMeta,
          members.isAcceptableOrUnknown(data['members']!, _membersMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('public')) {
      context.handle(_publicMeta,
          public.isAcceptableOrUnknown(data['public']!, _publicMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Group map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Group.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(_db, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final String id;
  final String title;
  final String description;
  final String image;
  final String dateAndTime;
  final String groupId;
  final String category;
  final String location;
  final int attendees;
  final DateTime createdAt;
  final DateTime updatedAt;
  Event(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.dateAndTime,
      required this.groupId,
      required this.category,
      required this.location,
      required this.attendees,
      required this.createdAt,
      required this.updatedAt});
  factory Event.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Event(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      dateAndTime: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_and_time'])!,
      groupId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}group_id'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
      attendees: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}attendees'])!,
      createdAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['image'] = Variable<String>(image);
    map['date_and_time'] = Variable<String>(dateAndTime);
    map['group_id'] = Variable<String>(groupId);
    map['category'] = Variable<String>(category);
    map['location'] = Variable<String>(location);
    map['attendees'] = Variable<int>(attendees);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      image: Value(image),
      dateAndTime: Value(dateAndTime),
      groupId: Value(groupId),
      category: Value(category),
      location: Value(location),
      attendees: Value(attendees),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Event.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      dateAndTime: serializer.fromJson<String>(json['dateAndTime']),
      groupId: serializer.fromJson<String>(json['groupId']),
      category: serializer.fromJson<String>(json['category']),
      location: serializer.fromJson<String>(json['location']),
      attendees: serializer.fromJson<int>(json['attendees']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'dateAndTime': serializer.toJson<String>(dateAndTime),
      'groupId': serializer.toJson<String>(groupId),
      'category': serializer.toJson<String>(category),
      'location': serializer.toJson<String>(location),
      'attendees': serializer.toJson<int>(attendees),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Event copyWith(
          {String? id,
          String? title,
          String? description,
          String? image,
          String? dateAndTime,
          String? groupId,
          String? category,
          String? location,
          int? attendees,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Event(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        dateAndTime: dateAndTime ?? this.dateAndTime,
        groupId: groupId ?? this.groupId,
        category: category ?? this.category,
        location: location ?? this.location,
        attendees: attendees ?? this.attendees,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('dateAndTime: $dateAndTime, ')
          ..write('groupId: $groupId, ')
          ..write('category: $category, ')
          ..write('location: $location, ')
          ..write('attendees: $attendees, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  image.hashCode,
                  $mrjc(
                      dateAndTime.hashCode,
                      $mrjc(
                          groupId.hashCode,
                          $mrjc(
                              category.hashCode,
                              $mrjc(
                                  location.hashCode,
                                  $mrjc(
                                      attendees.hashCode,
                                      $mrjc(createdAt.hashCode,
                                          updatedAt.hashCode)))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.image == this.image &&
          other.dateAndTime == this.dateAndTime &&
          other.groupId == this.groupId &&
          other.category == this.category &&
          other.location == this.location &&
          other.attendees == this.attendees &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> description;
  final Value<String> image;
  final Value<String> dateAndTime;
  final Value<String> groupId;
  final Value<String> category;
  final Value<String> location;
  final Value<int> attendees;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.dateAndTime = const Value.absent(),
    this.groupId = const Value.absent(),
    this.category = const Value.absent(),
    this.location = const Value.absent(),
    this.attendees = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EventsCompanion.insert({
    required String id,
    required String title,
    required String description,
    required String image,
    required String dateAndTime,
    required String groupId,
    required String category,
    required String location,
    this.attendees = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : id = Value(id),
        title = Value(title),
        description = Value(description),
        image = Value(image),
        dateAndTime = Value(dateAndTime),
        groupId = Value(groupId),
        category = Value(category),
        location = Value(location),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Event> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? image,
    Expression<String>? dateAndTime,
    Expression<String>? groupId,
    Expression<String>? category,
    Expression<String>? location,
    Expression<int>? attendees,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (dateAndTime != null) 'date_and_time': dateAndTime,
      if (groupId != null) 'group_id': groupId,
      if (category != null) 'category': category,
      if (location != null) 'location': location,
      if (attendees != null) 'attendees': attendees,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? description,
      Value<String>? image,
      Value<String>? dateAndTime,
      Value<String>? groupId,
      Value<String>? category,
      Value<String>? location,
      Value<int>? attendees,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return EventsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      dateAndTime: dateAndTime ?? this.dateAndTime,
      groupId: groupId ?? this.groupId,
      category: category ?? this.category,
      location: location ?? this.location,
      attendees: attendees ?? this.attendees,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (dateAndTime.present) {
      map['date_and_time'] = Variable<String>(dateAndTime.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (attendees.present) {
      map['attendees'] = Variable<int>(attendees.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('dateAndTime: $dateAndTime, ')
          ..write('groupId: $groupId, ')
          ..write('category: $category, ')
          ..write('location: $location, ')
          ..write('attendees: $attendees, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EventsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _dateAndTimeMeta =
      const VerificationMeta('dateAndTime');
  late final GeneratedColumn<String?> dateAndTime = GeneratedColumn<String?>(
      'date_and_time', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  late final GeneratedColumn<String?> groupId = GeneratedColumn<String?>(
      'group_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _attendeesMeta = const VerificationMeta('attendees');
  late final GeneratedColumn<int?> attendees = GeneratedColumn<int?>(
      'attendees', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        description,
        image,
        dateAndTime,
        groupId,
        category,
        location,
        attendees,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'events';
  @override
  String get actualTableName => 'events';
  @override
  VerificationContext validateIntegrity(Insertable<Event> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('date_and_time')) {
      context.handle(
          _dateAndTimeMeta,
          dateAndTime.isAcceptableOrUnknown(
              data['date_and_time']!, _dateAndTimeMeta));
    } else if (isInserting) {
      context.missing(_dateAndTimeMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('attendees')) {
      context.handle(_attendeesMeta,
          attendees.isAcceptableOrUnknown(data['attendees']!, _attendeesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Event.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GroupsTable groups = $GroupsTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final GroupsDao groupsDao = GroupsDao(this as AppDatabase);
  late final EventsDao eventsDao = EventsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [groups, events];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$GroupsDaoMixin on DatabaseAccessor<AppDatabase> {
  $GroupsTable get groups => attachedDatabase.groups;
}
mixin _$EventsDaoMixin on DatabaseAccessor<AppDatabase> {
  $EventsTable get events => attachedDatabase.events;
}
