// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CommunityMemberModelAdapter extends TypeAdapter<CommunityMemberModel> {
  @override
  final int typeId = 3;

  @override
  CommunityMemberModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommunityMemberModel(
      id: fields[0] as String,
      user: fields[1] as UserModel,
      userId: fields[2] as String,
      community: fields[3] as CommunityModel,
      communityId: fields[4] as String,
      banned: fields[5] as bool,
      admin: fields[6] as bool,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CommunityMemberModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.community)
      ..writeByte(4)
      ..write(obj.communityId)
      ..writeByte(5)
      ..write(obj.banned)
      ..writeByte(6)
      ..write(obj.admin)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommunityMemberModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
