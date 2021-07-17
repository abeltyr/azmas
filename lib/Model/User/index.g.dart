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
      firstName: fields[1] as String?,
      lastName: fields[2] as String?,
      phoneNumber: fields[3] as String?,
      email: fields[4] as String?,
      userName: fields[5] as String,
      avatar: fields[6] as String,
      background: fields[7] as String?,
      birthDate: fields[8] as String?,
      active: fields[9] as bool?,
      sex: fields[10] as String?,
      instagram: fields[11] as String?,
      twitter: fields[12] as String?,
      telegram: fields[13] as String?,
      verified: fields[14] as bool?,
      createdAt: fields[15] as String?,
      updatedAt: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.lastName)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.userName)
      ..writeByte(6)
      ..write(obj.avatar)
      ..writeByte(7)
      ..write(obj.background)
      ..writeByte(8)
      ..write(obj.birthDate)
      ..writeByte(9)
      ..write(obj.active)
      ..writeByte(10)
      ..write(obj.sex)
      ..writeByte(11)
      ..write(obj.instagram)
      ..writeByte(12)
      ..write(obj.twitter)
      ..writeByte(13)
      ..write(obj.telegram)
      ..writeByte(14)
      ..write(obj.verified)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
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
