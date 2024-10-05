// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entryHigherLevel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntryHigherLevelAdapter extends TypeAdapter<EntryHigherLevel> {
  @override
  final int typeId = 4;

  @override
  EntryHigherLevel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EntryHigherLevel(
      fields[0] as String,
      fields[1] as String,
      (fields[2] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, EntryHigherLevel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.entries);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntryHigherLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
