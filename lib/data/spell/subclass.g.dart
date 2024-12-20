// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subclass.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubClassesAdapter extends TypeAdapter<SubClasses> {
  @override
  final int typeId = 6;

  @override
  SubClasses read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubClasses.fromHive(
      fields[0] as DnDClass,
      (fields[1] as Map).cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, SubClasses obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.c)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubClassesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
