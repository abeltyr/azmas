// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventCategoryAdapter extends TypeAdapter<EventCategory> {
  @override
  final int typeId = 5;

  @override
  EventCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EventCategory.Education;
      case 1:
        return EventCategory.GetTogether;
      case 2:
        return EventCategory.SchoolEvent;
      case 3:
        return EventCategory.Party;
      case 4:
        return EventCategory.Seminars;
      case 5:
        return EventCategory.Fun;
      default:
        return EventCategory.Education;
    }
  }

  @override
  void write(BinaryWriter writer, EventCategory obj) {
    switch (obj) {
      case EventCategory.Education:
        writer.writeByte(0);
        break;
      case EventCategory.GetTogether:
        writer.writeByte(1);
        break;
      case EventCategory.SchoolEvent:
        writer.writeByte(2);
        break;
      case EventCategory.Party:
        writer.writeByte(3);
        break;
      case EventCategory.Seminars:
        writer.writeByte(4);
        break;
      case EventCategory.Fun:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EventModelAdapter extends TypeAdapter<EventModel> {
  @override
  final int typeId = 6;

  @override
  EventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventModel(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      image: fields[3] as String,
      dateTime: fields[4] as String,
      groupId: fields[5] as String,
      group: fields[6] as GroupModal?,
      category: fields[7] as EventCategory,
      location: fields[8] as String,
      attended: fields[9] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, EventModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.dateTime)
      ..writeByte(5)
      ..write(obj.groupId)
      ..writeByte(6)
      ..write(obj.group)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.attended);
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
