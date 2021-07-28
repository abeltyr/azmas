// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventModelAdapter extends TypeAdapter<EventModel> {
  @override
  final int typeId = 4;

  @override
  EventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventModel(
      id: fields[0] as String,
      user: fields[1] as UserModel?,
      creatorId: fields[2] as String,
      group: fields[3] as GroupModel?,
      groupId: fields[4] as String,
      title: fields[5] as String,
      description: fields[6] as String?,
      image: fields[7] as String,
      category: fields[8] as String,
      horizontal: fields[9] as bool,
      eventStartDate: fields[10] as DateTime,
      eventEndDate: fields[11] as DateTime,
      location: fields[12] as String,
      price: fields[13] as double,
      createdAt: fields[14] as DateTime,
      updatedAt: fields[15] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, EventModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.creatorId)
      ..writeByte(3)
      ..write(obj.group)
      ..writeByte(4)
      ..write(obj.groupId)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.horizontal)
      ..writeByte(10)
      ..write(obj.eventStartDate)
      ..writeByte(11)
      ..write(obj.eventEndDate)
      ..writeByte(12)
      ..write(obj.location)
      ..writeByte(13)
      ..write(obj.price)
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
      other is EventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
