// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TicketModelAdapter extends TypeAdapter<TicketModel> {
  @override
  final int typeId = 3;

  @override
  TicketModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TicketModel(
      id: fields[0] as String,
      user: fields[1] as UserModel,
      userId: fields[2] as String,
      group: fields[3] as GroupModel,
      groupId: fields[4] as String,
      event: fields[5] as EventModel,
      eventId: fields[6] as String,
      eventStartDate: fields[7] as DateTime,
      eventEndDate: fields[8] as DateTime,
      used: fields[10] as bool,
      price: fields[9] as double,
      createdAt: fields[11] as DateTime,
      updatedAt: fields[12] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TicketModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.userId)
      ..writeByte(3)
      ..write(obj.group)
      ..writeByte(4)
      ..write(obj.groupId)
      ..writeByte(5)
      ..write(obj.event)
      ..writeByte(6)
      ..write(obj.eventId)
      ..writeByte(7)
      ..write(obj.eventStartDate)
      ..writeByte(8)
      ..write(obj.eventEndDate)
      ..writeByte(9)
      ..write(obj.price)
      ..writeByte(10)
      ..write(obj.used)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TicketModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
