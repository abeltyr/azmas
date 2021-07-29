// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as String,
      fullName: fields[1] as String,
      phoneNumber: fields[2] as String,
      email: fields[3] as String,
      userName: fields[4] as String,
      bio: fields[5] as String?,
      gender: fields[6] as String,
      birthDate: fields[7] as DateTime?,
      avatar: fields[8] as String,
      instagram: fields[9] as String?,
      twitter: fields[10] as String?,
      telegram: fields[11] as String?,
      facebook: fields[12] as String?,
      verified: fields[13] as bool?,
      activated: fields[14] as bool?,
      token: fields[15] as String?,
      createdAt: fields[16] as DateTime?,
      updatedAt: fields[17] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.userName)
      ..writeByte(5)
      ..write(obj.bio)
      ..writeByte(6)
      ..write(obj.gender)
      ..writeByte(7)
      ..write(obj.birthDate)
      ..writeByte(8)
      ..write(obj.avatar)
      ..writeByte(9)
      ..write(obj.instagram)
      ..writeByte(10)
      ..write(obj.twitter)
      ..writeByte(11)
      ..write(obj.telegram)
      ..writeByte(12)
      ..write(obj.facebook)
      ..writeByte(13)
      ..write(obj.verified)
      ..writeByte(14)
      ..write(obj.activated)
      ..writeByte(15)
      ..write(obj.token)
      ..writeByte(16)
      ..write(obj.createdAt)
      ..writeByte(17)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
