// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moorDatabase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String email;
  final String userName;
  final String? bio;
  final String gender;
  final DateTime birthDate;
  final String? instagram;
  final String? twitter;
  final String? telegram;
  final String? facebook;
  final bool verified;
  final bool activated;
  final DateTime createdAt;
  final DateTime updatedAt;
  User(
      {required this.id,
      required this.fullName,
      required this.phoneNumber,
      required this.email,
      required this.userName,
      this.bio,
      required this.gender,
      required this.birthDate,
      this.instagram,
      this.twitter,
      this.telegram,
      this.facebook,
      required this.verified,
      required this.activated,
      required this.createdAt,
      required this.updatedAt});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return User(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      fullName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}full_name'])!,
      phoneNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone_number'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
      userName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_name'])!,
      bio: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bio']),
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
      birthDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_date'])!,
      instagram: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}instagram']),
      twitter: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}twitter']),
      telegram: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}telegram']),
      facebook: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}facebook']),
      verified: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}verified'])!,
      activated: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}activated'])!,
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
    map['full_name'] = Variable<String>(fullName);
    map['phone_number'] = Variable<String>(phoneNumber);
    map['email'] = Variable<String>(email);
    map['user_name'] = Variable<String>(userName);
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String?>(bio);
    }
    map['gender'] = Variable<String>(gender);
    map['birth_date'] = Variable<DateTime>(birthDate);
    if (!nullToAbsent || instagram != null) {
      map['instagram'] = Variable<String?>(instagram);
    }
    if (!nullToAbsent || twitter != null) {
      map['twitter'] = Variable<String?>(twitter);
    }
    if (!nullToAbsent || telegram != null) {
      map['telegram'] = Variable<String?>(telegram);
    }
    if (!nullToAbsent || facebook != null) {
      map['facebook'] = Variable<String?>(facebook);
    }
    map['verified'] = Variable<bool>(verified);
    map['activated'] = Variable<bool>(activated);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      fullName: Value(fullName),
      phoneNumber: Value(phoneNumber),
      email: Value(email),
      userName: Value(userName),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      gender: Value(gender),
      birthDate: Value(birthDate),
      instagram: instagram == null && nullToAbsent
          ? const Value.absent()
          : Value(instagram),
      twitter: twitter == null && nullToAbsent
          ? const Value.absent()
          : Value(twitter),
      telegram: telegram == null && nullToAbsent
          ? const Value.absent()
          : Value(telegram),
      facebook: facebook == null && nullToAbsent
          ? const Value.absent()
          : Value(facebook),
      verified: Value(verified),
      activated: Value(activated),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<String>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      email: serializer.fromJson<String>(json['email']),
      userName: serializer.fromJson<String>(json['userName']),
      bio: serializer.fromJson<String?>(json['bio']),
      gender: serializer.fromJson<String>(json['gender']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      instagram: serializer.fromJson<String?>(json['instagram']),
      twitter: serializer.fromJson<String?>(json['twitter']),
      telegram: serializer.fromJson<String?>(json['telegram']),
      facebook: serializer.fromJson<String?>(json['facebook']),
      verified: serializer.fromJson<bool>(json['verified']),
      activated: serializer.fromJson<bool>(json['activated']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fullName': serializer.toJson<String>(fullName),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'email': serializer.toJson<String>(email),
      'userName': serializer.toJson<String>(userName),
      'bio': serializer.toJson<String?>(bio),
      'gender': serializer.toJson<String>(gender),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'instagram': serializer.toJson<String?>(instagram),
      'twitter': serializer.toJson<String?>(twitter),
      'telegram': serializer.toJson<String?>(telegram),
      'facebook': serializer.toJson<String?>(facebook),
      'verified': serializer.toJson<bool>(verified),
      'activated': serializer.toJson<bool>(activated),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  User copyWith(
          {String? id,
          String? fullName,
          String? phoneNumber,
          String? email,
          String? userName,
          String? bio,
          String? gender,
          DateTime? birthDate,
          String? instagram,
          String? twitter,
          String? telegram,
          String? facebook,
          bool? verified,
          bool? activated,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      User(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        userName: userName ?? this.userName,
        bio: bio ?? this.bio,
        gender: gender ?? this.gender,
        birthDate: birthDate ?? this.birthDate,
        instagram: instagram ?? this.instagram,
        twitter: twitter ?? this.twitter,
        telegram: telegram ?? this.telegram,
        facebook: facebook ?? this.facebook,
        verified: verified ?? this.verified,
        activated: activated ?? this.activated,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('userName: $userName, ')
          ..write('bio: $bio, ')
          ..write('gender: $gender, ')
          ..write('birthDate: $birthDate, ')
          ..write('instagram: $instagram, ')
          ..write('twitter: $twitter, ')
          ..write('telegram: $telegram, ')
          ..write('facebook: $facebook, ')
          ..write('verified: $verified, ')
          ..write('activated: $activated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          fullName.hashCode,
          $mrjc(
              phoneNumber.hashCode,
              $mrjc(
                  email.hashCode,
                  $mrjc(
                      userName.hashCode,
                      $mrjc(
                          bio.hashCode,
                          $mrjc(
                              gender.hashCode,
                              $mrjc(
                                  birthDate.hashCode,
                                  $mrjc(
                                      instagram.hashCode,
                                      $mrjc(
                                          twitter.hashCode,
                                          $mrjc(
                                              telegram.hashCode,
                                              $mrjc(
                                                  facebook.hashCode,
                                                  $mrjc(
                                                      verified.hashCode,
                                                      $mrjc(
                                                          activated.hashCode,
                                                          $mrjc(
                                                              createdAt
                                                                  .hashCode,
                                                              updatedAt
                                                                  .hashCode))))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.phoneNumber == this.phoneNumber &&
          other.email == this.email &&
          other.userName == this.userName &&
          other.bio == this.bio &&
          other.gender == this.gender &&
          other.birthDate == this.birthDate &&
          other.instagram == this.instagram &&
          other.twitter == this.twitter &&
          other.telegram == this.telegram &&
          other.facebook == this.facebook &&
          other.verified == this.verified &&
          other.activated == this.activated &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> id;
  final Value<String> fullName;
  final Value<String> phoneNumber;
  final Value<String> email;
  final Value<String> userName;
  final Value<String?> bio;
  final Value<String> gender;
  final Value<DateTime> birthDate;
  final Value<String?> instagram;
  final Value<String?> twitter;
  final Value<String?> telegram;
  final Value<String?> facebook;
  final Value<bool> verified;
  final Value<bool> activated;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.userName = const Value.absent(),
    this.bio = const Value.absent(),
    this.gender = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.instagram = const Value.absent(),
    this.twitter = const Value.absent(),
    this.telegram = const Value.absent(),
    this.facebook = const Value.absent(),
    this.verified = const Value.absent(),
    this.activated = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    required String id,
    required String fullName,
    required String phoneNumber,
    required String email,
    required String userName,
    this.bio = const Value.absent(),
    required String gender,
    required DateTime birthDate,
    this.instagram = const Value.absent(),
    this.twitter = const Value.absent(),
    this.telegram = const Value.absent(),
    this.facebook = const Value.absent(),
    this.verified = const Value.absent(),
    this.activated = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : id = Value(id),
        fullName = Value(fullName),
        phoneNumber = Value(phoneNumber),
        email = Value(email),
        userName = Value(userName),
        gender = Value(gender),
        birthDate = Value(birthDate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<User> custom({
    Expression<String>? id,
    Expression<String>? fullName,
    Expression<String>? phoneNumber,
    Expression<String>? email,
    Expression<String>? userName,
    Expression<String?>? bio,
    Expression<String>? gender,
    Expression<DateTime>? birthDate,
    Expression<String?>? instagram,
    Expression<String?>? twitter,
    Expression<String?>? telegram,
    Expression<String?>? facebook,
    Expression<bool>? verified,
    Expression<bool>? activated,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (email != null) 'email': email,
      if (userName != null) 'user_name': userName,
      if (bio != null) 'bio': bio,
      if (gender != null) 'gender': gender,
      if (birthDate != null) 'birth_date': birthDate,
      if (instagram != null) 'instagram': instagram,
      if (twitter != null) 'twitter': twitter,
      if (telegram != null) 'telegram': telegram,
      if (facebook != null) 'facebook': facebook,
      if (verified != null) 'verified': verified,
      if (activated != null) 'activated': activated,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? id,
      Value<String>? fullName,
      Value<String>? phoneNumber,
      Value<String>? email,
      Value<String>? userName,
      Value<String?>? bio,
      Value<String>? gender,
      Value<DateTime>? birthDate,
      Value<String?>? instagram,
      Value<String?>? twitter,
      Value<String?>? telegram,
      Value<String?>? facebook,
      Value<bool>? verified,
      Value<bool>? activated,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return UsersCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      instagram: instagram ?? this.instagram,
      twitter: twitter ?? this.twitter,
      telegram: telegram ?? this.telegram,
      facebook: facebook ?? this.facebook,
      verified: verified ?? this.verified,
      activated: activated ?? this.activated,
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
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String?>(bio.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (instagram.present) {
      map['instagram'] = Variable<String?>(instagram.value);
    }
    if (twitter.present) {
      map['twitter'] = Variable<String?>(twitter.value);
    }
    if (telegram.present) {
      map['telegram'] = Variable<String?>(telegram.value);
    }
    if (facebook.present) {
      map['facebook'] = Variable<String?>(facebook.value);
    }
    if (verified.present) {
      map['verified'] = Variable<bool>(verified.value);
    }
    if (activated.present) {
      map['activated'] = Variable<bool>(activated.value);
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
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('email: $email, ')
          ..write('userName: $userName, ')
          ..write('bio: $bio, ')
          ..write('gender: $gender, ')
          ..write('birthDate: $birthDate, ')
          ..write('instagram: $instagram, ')
          ..write('twitter: $twitter, ')
          ..write('telegram: $telegram, ')
          ..write('facebook: $facebook, ')
          ..write('verified: $verified, ')
          ..write('activated: $activated, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  late final GeneratedColumn<String?> fullName = GeneratedColumn<String?>(
      'full_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  late final GeneratedColumn<String?> phoneNumber = GeneratedColumn<String?>(
      'phone_number', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _userNameMeta = const VerificationMeta('userName');
  late final GeneratedColumn<String?> userName = GeneratedColumn<String?>(
      'user_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _bioMeta = const VerificationMeta('bio');
  late final GeneratedColumn<String?> bio = GeneratedColumn<String?>(
      'bio', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _birthDateMeta = const VerificationMeta('birthDate');
  late final GeneratedColumn<DateTime?> birthDate = GeneratedColumn<DateTime?>(
      'birth_date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _instagramMeta = const VerificationMeta('instagram');
  late final GeneratedColumn<String?> instagram = GeneratedColumn<String?>(
      'instagram', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _twitterMeta = const VerificationMeta('twitter');
  late final GeneratedColumn<String?> twitter = GeneratedColumn<String?>(
      'twitter', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _telegramMeta = const VerificationMeta('telegram');
  late final GeneratedColumn<String?> telegram = GeneratedColumn<String?>(
      'telegram', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _facebookMeta = const VerificationMeta('facebook');
  late final GeneratedColumn<String?> facebook = GeneratedColumn<String?>(
      'facebook', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _verifiedMeta = const VerificationMeta('verified');
  late final GeneratedColumn<bool?> verified = GeneratedColumn<bool?>(
      'verified', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (verified IN (0, 1))',
      defaultValue: Constant(true));
  final VerificationMeta _activatedMeta = const VerificationMeta('activated');
  late final GeneratedColumn<bool?> activated = GeneratedColumn<bool?>(
      'activated', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (activated IN (0, 1))',
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
        fullName,
        phoneNumber,
        email,
        userName,
        bio,
        gender,
        birthDate,
        instagram,
        twitter,
        telegram,
        facebook,
        verified,
        activated,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('bio')) {
      context.handle(
          _bioMeta, bio.isAcceptableOrUnknown(data['bio']!, _bioMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('instagram')) {
      context.handle(_instagramMeta,
          instagram.isAcceptableOrUnknown(data['instagram']!, _instagramMeta));
    }
    if (data.containsKey('twitter')) {
      context.handle(_twitterMeta,
          twitter.isAcceptableOrUnknown(data['twitter']!, _twitterMeta));
    }
    if (data.containsKey('telegram')) {
      context.handle(_telegramMeta,
          telegram.isAcceptableOrUnknown(data['telegram']!, _telegramMeta));
    }
    if (data.containsKey('facebook')) {
      context.handle(_facebookMeta,
          facebook.isAcceptableOrUnknown(data['facebook']!, _facebookMeta));
    }
    if (data.containsKey('verified')) {
      context.handle(_verifiedMeta,
          verified.isAcceptableOrUnknown(data['verified']!, _verifiedMeta));
    }
    if (data.containsKey('activated')) {
      context.handle(_activatedMeta,
          activated.isAcceptableOrUnknown(data['activated']!, _activatedMeta));
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
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    return User.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Group extends DataClass implements Insertable<Group> {
  final String id;
  final String ownerId;
  final String title;
  final String description;
  final String background;
  final String avatar;
  final bool public;
  final bool verified;
  final bool activated;
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;
  Group(
      {required this.id,
      required this.ownerId,
      required this.title,
      required this.description,
      required this.background,
      required this.avatar,
      required this.public,
      required this.verified,
      required this.activated,
      required this.category,
      required this.createdAt,
      required this.updatedAt});
  factory Group.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Group(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      ownerId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}owner_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      background: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}background'])!,
      avatar: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}avatar'])!,
      public: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}public'])!,
      verified: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}verified'])!,
      activated: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}activated'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
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
    map['owner_id'] = Variable<String>(ownerId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['background'] = Variable<String>(background);
    map['avatar'] = Variable<String>(avatar);
    map['public'] = Variable<bool>(public);
    map['verified'] = Variable<bool>(verified);
    map['activated'] = Variable<bool>(activated);
    map['category'] = Variable<String>(category);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      id: Value(id),
      ownerId: Value(ownerId),
      title: Value(title),
      description: Value(description),
      background: Value(background),
      avatar: Value(avatar),
      public: Value(public),
      verified: Value(verified),
      activated: Value(activated),
      category: Value(category),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Group.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Group(
      id: serializer.fromJson<String>(json['id']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      background: serializer.fromJson<String>(json['background']),
      avatar: serializer.fromJson<String>(json['avatar']),
      public: serializer.fromJson<bool>(json['public']),
      verified: serializer.fromJson<bool>(json['verified']),
      activated: serializer.fromJson<bool>(json['activated']),
      category: serializer.fromJson<String>(json['category']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerId': serializer.toJson<String>(ownerId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'background': serializer.toJson<String>(background),
      'avatar': serializer.toJson<String>(avatar),
      'public': serializer.toJson<bool>(public),
      'verified': serializer.toJson<bool>(verified),
      'activated': serializer.toJson<bool>(activated),
      'category': serializer.toJson<String>(category),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Group copyWith(
          {String? id,
          String? ownerId,
          String? title,
          String? description,
          String? background,
          String? avatar,
          bool? public,
          bool? verified,
          bool? activated,
          String? category,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Group(
        id: id ?? this.id,
        ownerId: ownerId ?? this.ownerId,
        title: title ?? this.title,
        description: description ?? this.description,
        background: background ?? this.background,
        avatar: avatar ?? this.avatar,
        public: public ?? this.public,
        verified: verified ?? this.verified,
        activated: activated ?? this.activated,
        category: category ?? this.category,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Group(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('background: $background, ')
          ..write('avatar: $avatar, ')
          ..write('public: $public, ')
          ..write('verified: $verified, ')
          ..write('activated: $activated, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          ownerId.hashCode,
          $mrjc(
              title.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      background.hashCode,
                      $mrjc(
                          avatar.hashCode,
                          $mrjc(
                              public.hashCode,
                              $mrjc(
                                  verified.hashCode,
                                  $mrjc(
                                      activated.hashCode,
                                      $mrjc(
                                          category.hashCode,
                                          $mrjc(createdAt.hashCode,
                                              updatedAt.hashCode))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Group &&
          other.id == this.id &&
          other.ownerId == this.ownerId &&
          other.title == this.title &&
          other.description == this.description &&
          other.background == this.background &&
          other.avatar == this.avatar &&
          other.public == this.public &&
          other.verified == this.verified &&
          other.activated == this.activated &&
          other.category == this.category &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<String> id;
  final Value<String> ownerId;
  final Value<String> title;
  final Value<String> description;
  final Value<String> background;
  final Value<String> avatar;
  final Value<bool> public;
  final Value<bool> verified;
  final Value<bool> activated;
  final Value<String> category;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.background = const Value.absent(),
    this.avatar = const Value.absent(),
    this.public = const Value.absent(),
    this.verified = const Value.absent(),
    this.activated = const Value.absent(),
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GroupsCompanion.insert({
    required String id,
    required String ownerId,
    required String title,
    required String description,
    required String background,
    required String avatar,
    this.public = const Value.absent(),
    this.verified = const Value.absent(),
    this.activated = const Value.absent(),
    required String category,
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : id = Value(id),
        ownerId = Value(ownerId),
        title = Value(title),
        description = Value(description),
        background = Value(background),
        avatar = Value(avatar),
        category = Value(category),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Group> custom({
    Expression<String>? id,
    Expression<String>? ownerId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? background,
    Expression<String>? avatar,
    Expression<bool>? public,
    Expression<bool>? verified,
    Expression<bool>? activated,
    Expression<String>? category,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerId != null) 'owner_id': ownerId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (background != null) 'background': background,
      if (avatar != null) 'avatar': avatar,
      if (public != null) 'public': public,
      if (verified != null) 'verified': verified,
      if (activated != null) 'activated': activated,
      if (category != null) 'category': category,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GroupsCompanion copyWith(
      {Value<String>? id,
      Value<String>? ownerId,
      Value<String>? title,
      Value<String>? description,
      Value<String>? background,
      Value<String>? avatar,
      Value<bool>? public,
      Value<bool>? verified,
      Value<bool>? activated,
      Value<String>? category,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return GroupsCompanion(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      title: title ?? this.title,
      description: description ?? this.description,
      background: background ?? this.background,
      avatar: avatar ?? this.avatar,
      public: public ?? this.public,
      verified: verified ?? this.verified,
      activated: activated ?? this.activated,
      category: category ?? this.category,
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
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (background.present) {
      map['background'] = Variable<String>(background.value);
    }
    if (avatar.present) {
      map['avatar'] = Variable<String>(avatar.value);
    }
    if (public.present) {
      map['public'] = Variable<bool>(public.value);
    }
    if (verified.present) {
      map['verified'] = Variable<bool>(verified.value);
    }
    if (activated.present) {
      map['activated'] = Variable<bool>(activated.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
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
          ..write('ownerId: $ownerId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('background: $background, ')
          ..write('avatar: $avatar, ')
          ..write('public: $public, ')
          ..write('verified: $verified, ')
          ..write('activated: $activated, ')
          ..write('category: $category, ')
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
  final VerificationMeta _ownerIdMeta = const VerificationMeta('ownerId');
  late final GeneratedColumn<String?> ownerId = GeneratedColumn<String?>(
      'owner_id', aliasedName, false,
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
  final VerificationMeta _backgroundMeta = const VerificationMeta('background');
  late final GeneratedColumn<String?> background = GeneratedColumn<String?>(
      'background', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _avatarMeta = const VerificationMeta('avatar');
  late final GeneratedColumn<String?> avatar = GeneratedColumn<String?>(
      'avatar', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _publicMeta = const VerificationMeta('public');
  late final GeneratedColumn<bool?> public = GeneratedColumn<bool?>(
      'public', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (public IN (0, 1))',
      defaultValue: Constant(true));
  final VerificationMeta _verifiedMeta = const VerificationMeta('verified');
  late final GeneratedColumn<bool?> verified = GeneratedColumn<bool?>(
      'verified', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (verified IN (0, 1))',
      defaultValue: Constant(true));
  final VerificationMeta _activatedMeta = const VerificationMeta('activated');
  late final GeneratedColumn<bool?> activated = GeneratedColumn<bool?>(
      'activated', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (activated IN (0, 1))',
      defaultValue: Constant(true));
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
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
        ownerId,
        title,
        description,
        background,
        avatar,
        public,
        verified,
        activated,
        category,
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
    if (data.containsKey('owner_id')) {
      context.handle(_ownerIdMeta,
          ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta));
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
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
    if (data.containsKey('background')) {
      context.handle(
          _backgroundMeta,
          background.isAcceptableOrUnknown(
              data['background']!, _backgroundMeta));
    } else if (isInserting) {
      context.missing(_backgroundMeta);
    }
    if (data.containsKey('avatar')) {
      context.handle(_avatarMeta,
          avatar.isAcceptableOrUnknown(data['avatar']!, _avatarMeta));
    } else if (isInserting) {
      context.missing(_avatarMeta);
    }
    if (data.containsKey('public')) {
      context.handle(_publicMeta,
          public.isAcceptableOrUnknown(data['public']!, _publicMeta));
    }
    if (data.containsKey('verified')) {
      context.handle(_verifiedMeta,
          verified.isAcceptableOrUnknown(data['verified']!, _verifiedMeta));
    }
    if (data.containsKey('activated')) {
      context.handle(_activatedMeta,
          activated.isAcceptableOrUnknown(data['activated']!, _activatedMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
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

class GroupMember extends DataClass implements Insertable<GroupMember> {
  final String id;
  final String userId;
  final String groupId;
  final bool admin;
  final bool banned;
  final DateTime createdAt;
  final DateTime updatedAt;
  GroupMember(
      {required this.id,
      required this.userId,
      required this.groupId,
      required this.admin,
      required this.banned,
      required this.createdAt,
      required this.updatedAt});
  factory GroupMember.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return GroupMember(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      groupId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}group_id'])!,
      admin: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}admin'])!,
      banned: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}banned'])!,
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
    map['user_id'] = Variable<String>(userId);
    map['group_id'] = Variable<String>(groupId);
    map['admin'] = Variable<bool>(admin);
    map['banned'] = Variable<bool>(banned);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  GroupMembersCompanion toCompanion(bool nullToAbsent) {
    return GroupMembersCompanion(
      id: Value(id),
      userId: Value(userId),
      groupId: Value(groupId),
      admin: Value(admin),
      banned: Value(banned),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory GroupMember.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return GroupMember(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      groupId: serializer.fromJson<String>(json['groupId']),
      admin: serializer.fromJson<bool>(json['admin']),
      banned: serializer.fromJson<bool>(json['banned']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'groupId': serializer.toJson<String>(groupId),
      'admin': serializer.toJson<bool>(admin),
      'banned': serializer.toJson<bool>(banned),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  GroupMember copyWith(
          {String? id,
          String? userId,
          String? groupId,
          bool? admin,
          bool? banned,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      GroupMember(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        groupId: groupId ?? this.groupId,
        admin: admin ?? this.admin,
        banned: banned ?? this.banned,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('GroupMember(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('groupId: $groupId, ')
          ..write('admin: $admin, ')
          ..write('banned: $banned, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          userId.hashCode,
          $mrjc(
              groupId.hashCode,
              $mrjc(
                  admin.hashCode,
                  $mrjc(banned.hashCode,
                      $mrjc(createdAt.hashCode, updatedAt.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroupMember &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.groupId == this.groupId &&
          other.admin == this.admin &&
          other.banned == this.banned &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class GroupMembersCompanion extends UpdateCompanion<GroupMember> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> groupId;
  final Value<bool> admin;
  final Value<bool> banned;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const GroupMembersCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.admin = const Value.absent(),
    this.banned = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  GroupMembersCompanion.insert({
    required String id,
    required String userId,
    required String groupId,
    this.admin = const Value.absent(),
    this.banned = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : id = Value(id),
        userId = Value(userId),
        groupId = Value(groupId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<GroupMember> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? groupId,
    Expression<bool>? admin,
    Expression<bool>? banned,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (groupId != null) 'group_id': groupId,
      if (admin != null) 'admin': admin,
      if (banned != null) 'banned': banned,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  GroupMembersCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? groupId,
      Value<bool>? admin,
      Value<bool>? banned,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return GroupMembersCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      groupId: groupId ?? this.groupId,
      admin: admin ?? this.admin,
      banned: banned ?? this.banned,
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
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (admin.present) {
      map['admin'] = Variable<bool>(admin.value);
    }
    if (banned.present) {
      map['banned'] = Variable<bool>(banned.value);
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
    return (StringBuffer('GroupMembersCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('groupId: $groupId, ')
          ..write('admin: $admin, ')
          ..write('banned: $banned, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GroupMembersTable extends GroupMembers
    with TableInfo<$GroupMembersTable, GroupMember> {
  final GeneratedDatabase _db;
  final String? _alias;
  $GroupMembersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  late final GeneratedColumn<String?> groupId = GeneratedColumn<String?>(
      'group_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _adminMeta = const VerificationMeta('admin');
  late final GeneratedColumn<bool?> admin = GeneratedColumn<bool?>(
      'admin', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (admin IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _bannedMeta = const VerificationMeta('banned');
  late final GeneratedColumn<bool?> banned = GeneratedColumn<bool?>(
      'banned', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (banned IN (0, 1))',
      defaultValue: Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  late final GeneratedColumn<DateTime?> createdAt = GeneratedColumn<DateTime?>(
      'created_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  late final GeneratedColumn<DateTime?> updatedAt = GeneratedColumn<DateTime?>(
      'updated_at', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, groupId, admin, banned, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? 'group_members';
  @override
  String get actualTableName => 'group_members';
  @override
  VerificationContext validateIntegrity(Insertable<GroupMember> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('admin')) {
      context.handle(
          _adminMeta, admin.isAcceptableOrUnknown(data['admin']!, _adminMeta));
    }
    if (data.containsKey('banned')) {
      context.handle(_bannedMeta,
          banned.isAcceptableOrUnknown(data['banned']!, _bannedMeta));
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
  GroupMember map(Map<String, dynamic> data, {String? tablePrefix}) {
    return GroupMember.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GroupMembersTable createAlias(String alias) {
    return $GroupMembersTable(_db, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final String id;
  final String groupId;
  final String? creatorId;
  final String title;
  final String description;
  final String image;
  final bool horizontal;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final String category;
  final String location;
  final double price;
  final int attendees;
  final DateTime createdAt;
  final DateTime updatedAt;
  Event(
      {required this.id,
      required this.groupId,
      this.creatorId,
      required this.title,
      required this.description,
      required this.image,
      required this.horizontal,
      required this.eventStartDate,
      required this.eventEndDate,
      required this.category,
      required this.location,
      required this.price,
      required this.attendees,
      required this.createdAt,
      required this.updatedAt});
  factory Event.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Event(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      groupId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}group_id'])!,
      creatorId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}creator_id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      horizontal: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}horizontal'])!,
      eventStartDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_start_date'])!,
      eventEndDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_end_date'])!,
      category: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}category'])!,
      location: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location'])!,
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
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
    map['group_id'] = Variable<String>(groupId);
    if (!nullToAbsent || creatorId != null) {
      map['creator_id'] = Variable<String?>(creatorId);
    }
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['image'] = Variable<String>(image);
    map['horizontal'] = Variable<bool>(horizontal);
    map['event_start_date'] = Variable<DateTime>(eventStartDate);
    map['event_end_date'] = Variable<DateTime>(eventEndDate);
    map['category'] = Variable<String>(category);
    map['location'] = Variable<String>(location);
    map['price'] = Variable<double>(price);
    map['attendees'] = Variable<int>(attendees);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      groupId: Value(groupId),
      creatorId: creatorId == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorId),
      title: Value(title),
      description: Value(description),
      image: Value(image),
      horizontal: Value(horizontal),
      eventStartDate: Value(eventStartDate),
      eventEndDate: Value(eventEndDate),
      category: Value(category),
      location: Value(location),
      price: Value(price),
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
      groupId: serializer.fromJson<String>(json['groupId']),
      creatorId: serializer.fromJson<String?>(json['creatorId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      horizontal: serializer.fromJson<bool>(json['horizontal']),
      eventStartDate: serializer.fromJson<DateTime>(json['eventStartDate']),
      eventEndDate: serializer.fromJson<DateTime>(json['eventEndDate']),
      category: serializer.fromJson<String>(json['category']),
      location: serializer.fromJson<String>(json['location']),
      price: serializer.fromJson<double>(json['price']),
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
      'groupId': serializer.toJson<String>(groupId),
      'creatorId': serializer.toJson<String?>(creatorId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'horizontal': serializer.toJson<bool>(horizontal),
      'eventStartDate': serializer.toJson<DateTime>(eventStartDate),
      'eventEndDate': serializer.toJson<DateTime>(eventEndDate),
      'category': serializer.toJson<String>(category),
      'location': serializer.toJson<String>(location),
      'price': serializer.toJson<double>(price),
      'attendees': serializer.toJson<int>(attendees),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Event copyWith(
          {String? id,
          String? groupId,
          String? creatorId,
          String? title,
          String? description,
          String? image,
          bool? horizontal,
          DateTime? eventStartDate,
          DateTime? eventEndDate,
          String? category,
          String? location,
          double? price,
          int? attendees,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Event(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        creatorId: creatorId ?? this.creatorId,
        title: title ?? this.title,
        description: description ?? this.description,
        image: image ?? this.image,
        horizontal: horizontal ?? this.horizontal,
        eventStartDate: eventStartDate ?? this.eventStartDate,
        eventEndDate: eventEndDate ?? this.eventEndDate,
        category: category ?? this.category,
        location: location ?? this.location,
        price: price ?? this.price,
        attendees: attendees ?? this.attendees,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('creatorId: $creatorId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('horizontal: $horizontal, ')
          ..write('eventStartDate: $eventStartDate, ')
          ..write('eventEndDate: $eventEndDate, ')
          ..write('category: $category, ')
          ..write('location: $location, ')
          ..write('price: $price, ')
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
          groupId.hashCode,
          $mrjc(
              creatorId.hashCode,
              $mrjc(
                  title.hashCode,
                  $mrjc(
                      description.hashCode,
                      $mrjc(
                          image.hashCode,
                          $mrjc(
                              horizontal.hashCode,
                              $mrjc(
                                  eventStartDate.hashCode,
                                  $mrjc(
                                      eventEndDate.hashCode,
                                      $mrjc(
                                          category.hashCode,
                                          $mrjc(
                                              location.hashCode,
                                              $mrjc(
                                                  price.hashCode,
                                                  $mrjc(
                                                      attendees.hashCode,
                                                      $mrjc(
                                                          createdAt.hashCode,
                                                          updatedAt
                                                              .hashCode)))))))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.groupId == this.groupId &&
          other.creatorId == this.creatorId &&
          other.title == this.title &&
          other.description == this.description &&
          other.image == this.image &&
          other.horizontal == this.horizontal &&
          other.eventStartDate == this.eventStartDate &&
          other.eventEndDate == this.eventEndDate &&
          other.category == this.category &&
          other.location == this.location &&
          other.price == this.price &&
          other.attendees == this.attendees &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<String> id;
  final Value<String> groupId;
  final Value<String?> creatorId;
  final Value<String> title;
  final Value<String> description;
  final Value<String> image;
  final Value<bool> horizontal;
  final Value<DateTime> eventStartDate;
  final Value<DateTime> eventEndDate;
  final Value<String> category;
  final Value<String> location;
  final Value<double> price;
  final Value<int> attendees;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    this.creatorId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.horizontal = const Value.absent(),
    this.eventStartDate = const Value.absent(),
    this.eventEndDate = const Value.absent(),
    this.category = const Value.absent(),
    this.location = const Value.absent(),
    this.price = const Value.absent(),
    this.attendees = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EventsCompanion.insert({
    required String id,
    required String groupId,
    this.creatorId = const Value.absent(),
    required String title,
    required String description,
    required String image,
    this.horizontal = const Value.absent(),
    required DateTime eventStartDate,
    required DateTime eventEndDate,
    required String category,
    required String location,
    this.price = const Value.absent(),
    this.attendees = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : id = Value(id),
        groupId = Value(groupId),
        title = Value(title),
        description = Value(description),
        image = Value(image),
        eventStartDate = Value(eventStartDate),
        eventEndDate = Value(eventEndDate),
        category = Value(category),
        location = Value(location),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Event> custom({
    Expression<String>? id,
    Expression<String>? groupId,
    Expression<String?>? creatorId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? image,
    Expression<bool>? horizontal,
    Expression<DateTime>? eventStartDate,
    Expression<DateTime>? eventEndDate,
    Expression<String>? category,
    Expression<String>? location,
    Expression<double>? price,
    Expression<int>? attendees,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupId != null) 'group_id': groupId,
      if (creatorId != null) 'creator_id': creatorId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (horizontal != null) 'horizontal': horizontal,
      if (eventStartDate != null) 'event_start_date': eventStartDate,
      if (eventEndDate != null) 'event_end_date': eventEndDate,
      if (category != null) 'category': category,
      if (location != null) 'location': location,
      if (price != null) 'price': price,
      if (attendees != null) 'attendees': attendees,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EventsCompanion copyWith(
      {Value<String>? id,
      Value<String>? groupId,
      Value<String?>? creatorId,
      Value<String>? title,
      Value<String>? description,
      Value<String>? image,
      Value<bool>? horizontal,
      Value<DateTime>? eventStartDate,
      Value<DateTime>? eventEndDate,
      Value<String>? category,
      Value<String>? location,
      Value<double>? price,
      Value<int>? attendees,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return EventsCompanion(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      creatorId: creatorId ?? this.creatorId,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      horizontal: horizontal ?? this.horizontal,
      eventStartDate: eventStartDate ?? this.eventStartDate,
      eventEndDate: eventEndDate ?? this.eventEndDate,
      category: category ?? this.category,
      location: location ?? this.location,
      price: price ?? this.price,
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
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (creatorId.present) {
      map['creator_id'] = Variable<String?>(creatorId.value);
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
    if (horizontal.present) {
      map['horizontal'] = Variable<bool>(horizontal.value);
    }
    if (eventStartDate.present) {
      map['event_start_date'] = Variable<DateTime>(eventStartDate.value);
    }
    if (eventEndDate.present) {
      map['event_end_date'] = Variable<DateTime>(eventEndDate.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
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
          ..write('groupId: $groupId, ')
          ..write('creatorId: $creatorId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('horizontal: $horizontal, ')
          ..write('eventStartDate: $eventStartDate, ')
          ..write('eventEndDate: $eventEndDate, ')
          ..write('category: $category, ')
          ..write('location: $location, ')
          ..write('price: $price, ')
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
  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  late final GeneratedColumn<String?> groupId = GeneratedColumn<String?>(
      'group_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _creatorIdMeta = const VerificationMeta('creatorId');
  late final GeneratedColumn<String?> creatorId = GeneratedColumn<String?>(
      'creator_id', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
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
  final VerificationMeta _horizontalMeta = const VerificationMeta('horizontal');
  late final GeneratedColumn<bool?> horizontal = GeneratedColumn<bool?>(
      'horizontal', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (horizontal IN (0, 1))',
      defaultValue: Constant(true));
  final VerificationMeta _eventStartDateMeta =
      const VerificationMeta('eventStartDate');
  late final GeneratedColumn<DateTime?> eventStartDate =
      GeneratedColumn<DateTime?>('event_start_date', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _eventEndDateMeta =
      const VerificationMeta('eventEndDate');
  late final GeneratedColumn<DateTime?> eventEndDate =
      GeneratedColumn<DateTime?>('event_end_date', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  late final GeneratedColumn<String?> category = GeneratedColumn<String?>(
      'category', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _locationMeta = const VerificationMeta('location');
  late final GeneratedColumn<String?> location = GeneratedColumn<String?>(
      'location', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: false, clientDefault: () => 0);
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
        groupId,
        creatorId,
        title,
        description,
        image,
        horizontal,
        eventStartDate,
        eventEndDate,
        category,
        location,
        price,
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
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('creator_id')) {
      context.handle(_creatorIdMeta,
          creatorId.isAcceptableOrUnknown(data['creator_id']!, _creatorIdMeta));
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
    if (data.containsKey('horizontal')) {
      context.handle(
          _horizontalMeta,
          horizontal.isAcceptableOrUnknown(
              data['horizontal']!, _horizontalMeta));
    }
    if (data.containsKey('event_start_date')) {
      context.handle(
          _eventStartDateMeta,
          eventStartDate.isAcceptableOrUnknown(
              data['event_start_date']!, _eventStartDateMeta));
    } else if (isInserting) {
      context.missing(_eventStartDateMeta);
    }
    if (data.containsKey('event_end_date')) {
      context.handle(
          _eventEndDateMeta,
          eventEndDate.isAcceptableOrUnknown(
              data['event_end_date']!, _eventEndDateMeta));
    } else if (isInserting) {
      context.missing(_eventEndDateMeta);
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
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
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

class Ticket extends DataClass implements Insertable<Ticket> {
  final String id;
  final String groupId;
  final String eventId;
  final String userId;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final double price;
  final bool used;
  final DateTime createdAt;
  final DateTime updatedAt;
  Ticket(
      {required this.id,
      required this.groupId,
      required this.eventId,
      required this.userId,
      required this.eventStartDate,
      required this.eventEndDate,
      required this.price,
      required this.used,
      required this.createdAt,
      required this.updatedAt});
  factory Ticket.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Ticket(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      groupId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}group_id'])!,
      eventId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_id'])!,
      userId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id'])!,
      eventStartDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_start_date'])!,
      eventEndDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_end_date'])!,
      price: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}price'])!,
      used: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}used'])!,
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
    map['group_id'] = Variable<String>(groupId);
    map['event_id'] = Variable<String>(eventId);
    map['user_id'] = Variable<String>(userId);
    map['event_start_date'] = Variable<DateTime>(eventStartDate);
    map['event_end_date'] = Variable<DateTime>(eventEndDate);
    map['price'] = Variable<double>(price);
    map['used'] = Variable<bool>(used);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TicketsCompanion toCompanion(bool nullToAbsent) {
    return TicketsCompanion(
      id: Value(id),
      groupId: Value(groupId),
      eventId: Value(eventId),
      userId: Value(userId),
      eventStartDate: Value(eventStartDate),
      eventEndDate: Value(eventEndDate),
      price: Value(price),
      used: Value(used),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Ticket.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Ticket(
      id: serializer.fromJson<String>(json['id']),
      groupId: serializer.fromJson<String>(json['groupId']),
      eventId: serializer.fromJson<String>(json['eventId']),
      userId: serializer.fromJson<String>(json['userId']),
      eventStartDate: serializer.fromJson<DateTime>(json['eventStartDate']),
      eventEndDate: serializer.fromJson<DateTime>(json['eventEndDate']),
      price: serializer.fromJson<double>(json['price']),
      used: serializer.fromJson<bool>(json['used']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'groupId': serializer.toJson<String>(groupId),
      'eventId': serializer.toJson<String>(eventId),
      'userId': serializer.toJson<String>(userId),
      'eventStartDate': serializer.toJson<DateTime>(eventStartDate),
      'eventEndDate': serializer.toJson<DateTime>(eventEndDate),
      'price': serializer.toJson<double>(price),
      'used': serializer.toJson<bool>(used),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Ticket copyWith(
          {String? id,
          String? groupId,
          String? eventId,
          String? userId,
          DateTime? eventStartDate,
          DateTime? eventEndDate,
          double? price,
          bool? used,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Ticket(
        id: id ?? this.id,
        groupId: groupId ?? this.groupId,
        eventId: eventId ?? this.eventId,
        userId: userId ?? this.userId,
        eventStartDate: eventStartDate ?? this.eventStartDate,
        eventEndDate: eventEndDate ?? this.eventEndDate,
        price: price ?? this.price,
        used: used ?? this.used,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Ticket(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('eventId: $eventId, ')
          ..write('userId: $userId, ')
          ..write('eventStartDate: $eventStartDate, ')
          ..write('eventEndDate: $eventEndDate, ')
          ..write('price: $price, ')
          ..write('used: $used, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          groupId.hashCode,
          $mrjc(
              eventId.hashCode,
              $mrjc(
                  userId.hashCode,
                  $mrjc(
                      eventStartDate.hashCode,
                      $mrjc(
                          eventEndDate.hashCode,
                          $mrjc(
                              price.hashCode,
                              $mrjc(
                                  used.hashCode,
                                  $mrjc(createdAt.hashCode,
                                      updatedAt.hashCode))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ticket &&
          other.id == this.id &&
          other.groupId == this.groupId &&
          other.eventId == this.eventId &&
          other.userId == this.userId &&
          other.eventStartDate == this.eventStartDate &&
          other.eventEndDate == this.eventEndDate &&
          other.price == this.price &&
          other.used == this.used &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TicketsCompanion extends UpdateCompanion<Ticket> {
  final Value<String> id;
  final Value<String> groupId;
  final Value<String> eventId;
  final Value<String> userId;
  final Value<DateTime> eventStartDate;
  final Value<DateTime> eventEndDate;
  final Value<double> price;
  final Value<bool> used;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TicketsCompanion({
    this.id = const Value.absent(),
    this.groupId = const Value.absent(),
    this.eventId = const Value.absent(),
    this.userId = const Value.absent(),
    this.eventStartDate = const Value.absent(),
    this.eventEndDate = const Value.absent(),
    this.price = const Value.absent(),
    this.used = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TicketsCompanion.insert({
    required String id,
    required String groupId,
    required String eventId,
    required String userId,
    required DateTime eventStartDate,
    required DateTime eventEndDate,
    this.price = const Value.absent(),
    this.used = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : id = Value(id),
        groupId = Value(groupId),
        eventId = Value(eventId),
        userId = Value(userId),
        eventStartDate = Value(eventStartDate),
        eventEndDate = Value(eventEndDate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<Ticket> custom({
    Expression<String>? id,
    Expression<String>? groupId,
    Expression<String>? eventId,
    Expression<String>? userId,
    Expression<DateTime>? eventStartDate,
    Expression<DateTime>? eventEndDate,
    Expression<double>? price,
    Expression<bool>? used,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (groupId != null) 'group_id': groupId,
      if (eventId != null) 'event_id': eventId,
      if (userId != null) 'user_id': userId,
      if (eventStartDate != null) 'event_start_date': eventStartDate,
      if (eventEndDate != null) 'event_end_date': eventEndDate,
      if (price != null) 'price': price,
      if (used != null) 'used': used,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TicketsCompanion copyWith(
      {Value<String>? id,
      Value<String>? groupId,
      Value<String>? eventId,
      Value<String>? userId,
      Value<DateTime>? eventStartDate,
      Value<DateTime>? eventEndDate,
      Value<double>? price,
      Value<bool>? used,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return TicketsCompanion(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      eventId: eventId ?? this.eventId,
      userId: userId ?? this.userId,
      eventStartDate: eventStartDate ?? this.eventStartDate,
      eventEndDate: eventEndDate ?? this.eventEndDate,
      price: price ?? this.price,
      used: used ?? this.used,
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
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (eventStartDate.present) {
      map['event_start_date'] = Variable<DateTime>(eventStartDate.value);
    }
    if (eventEndDate.present) {
      map['event_end_date'] = Variable<DateTime>(eventEndDate.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (used.present) {
      map['used'] = Variable<bool>(used.value);
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
    return (StringBuffer('TicketsCompanion(')
          ..write('id: $id, ')
          ..write('groupId: $groupId, ')
          ..write('eventId: $eventId, ')
          ..write('userId: $userId, ')
          ..write('eventStartDate: $eventStartDate, ')
          ..write('eventEndDate: $eventEndDate, ')
          ..write('price: $price, ')
          ..write('used: $used, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TicketsTable extends Tickets with TableInfo<$TicketsTable, Ticket> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TicketsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _groupIdMeta = const VerificationMeta('groupId');
  late final GeneratedColumn<String?> groupId = GeneratedColumn<String?>(
      'group_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _eventIdMeta = const VerificationMeta('eventId');
  late final GeneratedColumn<String?> eventId = GeneratedColumn<String?>(
      'event_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<String?> userId = GeneratedColumn<String?>(
      'user_id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _eventStartDateMeta =
      const VerificationMeta('eventStartDate');
  late final GeneratedColumn<DateTime?> eventStartDate =
      GeneratedColumn<DateTime?>('event_start_date', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _eventEndDateMeta =
      const VerificationMeta('eventEndDate');
  late final GeneratedColumn<DateTime?> eventEndDate =
      GeneratedColumn<DateTime?>('event_end_date', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  late final GeneratedColumn<double?> price = GeneratedColumn<double?>(
      'price', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: false, clientDefault: () => 0);
  final VerificationMeta _usedMeta = const VerificationMeta('used');
  late final GeneratedColumn<bool?> used = GeneratedColumn<bool?>(
      'used', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (used IN (0, 1))',
      defaultValue: Constant(false));
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
        groupId,
        eventId,
        userId,
        eventStartDate,
        eventEndDate,
        price,
        used,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'tickets';
  @override
  String get actualTableName => 'tickets';
  @override
  VerificationContext validateIntegrity(Insertable<Ticket> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('event_id')) {
      context.handle(_eventIdMeta,
          eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta));
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('event_start_date')) {
      context.handle(
          _eventStartDateMeta,
          eventStartDate.isAcceptableOrUnknown(
              data['event_start_date']!, _eventStartDateMeta));
    } else if (isInserting) {
      context.missing(_eventStartDateMeta);
    }
    if (data.containsKey('event_end_date')) {
      context.handle(
          _eventEndDateMeta,
          eventEndDate.isAcceptableOrUnknown(
              data['event_end_date']!, _eventEndDateMeta));
    } else if (isInserting) {
      context.missing(_eventEndDateMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('used')) {
      context.handle(
          _usedMeta, used.isAcceptableOrUnknown(data['used']!, _usedMeta));
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
  Ticket map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Ticket.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TicketsTable createAlias(String alias) {
    return $TicketsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsersTable users = $UsersTable(this);
  late final $GroupsTable groups = $GroupsTable(this);
  late final $GroupMembersTable groupMembers = $GroupMembersTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $TicketsTable tickets = $TicketsTable(this);
  late final UsersDao usersDao = UsersDao(this as AppDatabase);
  late final GroupsDao groupsDao = GroupsDao(this as AppDatabase);
  late final GroupMembersDao groupMembersDao =
      GroupMembersDao(this as AppDatabase);
  late final EventsDao eventsDao = EventsDao(this as AppDatabase);
  late final TicketsDao ticketsDao = TicketsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, groups, groupMembers, events, tickets];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UsersDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
}
mixin _$GroupsDaoMixin on DatabaseAccessor<AppDatabase> {
  $GroupsTable get groups => attachedDatabase.groups;
}
mixin _$GroupMembersDaoMixin on DatabaseAccessor<AppDatabase> {
  $GroupMembersTable get groupMembers => attachedDatabase.groupMembers;
}
mixin _$EventsDaoMixin on DatabaseAccessor<AppDatabase> {
  $EventsTable get events => attachedDatabase.events;
}
mixin _$TicketsDaoMixin on DatabaseAccessor<AppDatabase> {
  $TicketsTable get tickets => attachedDatabase.tickets;
}
