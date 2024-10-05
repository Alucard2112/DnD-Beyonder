// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'components.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComponentsAdapter extends TypeAdapter<Components> {
  @override
  final int typeId = 2;

  @override
  Components read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Components(
      fields[0] as bool,
      fields[1] as bool,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Components obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.v)
      ..writeByte(1)
      ..write(obj.s)
      ..writeByte(2)
      ..write(obj.m);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComponentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
