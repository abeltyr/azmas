// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupCategoryAdapter extends TypeAdapter<GroupCategory> {
  @override
  final int typeId = 3;

  @override
  GroupCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GroupCategory.Educational;
      case 1:
        return GroupCategory.Friends;
      case 2:
        return GroupCategory.Community;
      case 3:
        return GroupCategory.Batch;
      case 4:
        return GroupCategory.Field;
      case 5:
        return GroupCategory.Class;
      case 6:
        return GroupCategory.Fun;
      default:
        return GroupCategory.Educational;
    }
  }

  @override
  void write(BinaryWriter writer, GroupCategory obj) {
    switch (obj) {
      case GroupCategory.Educational:
        writer.writeByte(0);
        break;
      case GroupCategory.Friends:
        writer.writeByte(1);
        break;
      case GroupCategory.Community:
        writer.writeByte(2);
        break;
      case GroupCategory.Batch:
        writer.writeByte(3);
        break;
      case GroupCategory.Field:
        writer.writeByte(4);
        break;
      case GroupCategory.Class:
        writer.writeByte(5);
        break;
      case GroupCategory.Fun:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GroupModalAdapter extends TypeAdapter<GroupModal> {
  @override
  final int typeId = 4;

  @override
  GroupModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupModal(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String?,
      colorTheme: fields[5] as String?,
      avatar: fields[3] as String,
      background: fields[4] as String?,
      members: fields[6] as int?,
      category: fields[7] as GroupCategory,
      public: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GroupModal obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.avatar)
      ..writeByte(4)
      ..write(obj.background)
      ..writeByte(5)
      ..write(obj.colorTheme)
      ..writeByte(6)
      ..write(obj.members)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.public);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
