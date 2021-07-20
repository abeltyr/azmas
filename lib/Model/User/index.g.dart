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
      id: fields[0] as String?,
      fullName: fields[1] as String?,
      phoneNumber: fields[2] as String?,
      email: fields[3] as String?,
      userName: fields[4] as String,
      avatar: fields[5] as String,
      background: fields[6] as String?,
      birthDate: fields[7] as String?,
      activated: fields[8] as bool?,
      gender: fields[9] as String?,
      instagram: fields[10] as String?,
      twitter: fields[11] as String?,
      telegram: fields[12] as String?,
      verified: fields[13] as bool?,
      createdAt: fields[14] as DateTime?,
      updatedAt: fields[15] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(16)
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
      ..write(obj.avatar)
      ..writeByte(6)
      ..write(obj.background)
      ..writeByte(7)
      ..write(obj.birthDate)
      ..writeByte(8)
      ..write(obj.activated)
      ..writeByte(9)
      ..write(obj.gender)
      ..writeByte(10)
      ..write(obj.instagram)
      ..writeByte(11)
      ..write(obj.twitter)
      ..writeByte(12)
      ..write(obj.telegram)
      ..writeByte(13)
      ..write(obj.verified)
      ..writeByte(14)
      ..write(obj.createdAt)
      ..writeByte(15)
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
