// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingModelAdapter extends TypeAdapter<SettingModel> {
  @override
  final int typeId = 0;

  @override
  SettingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingModel(
      intro: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SettingModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.intro);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
