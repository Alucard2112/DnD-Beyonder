// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'range.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RangeAdapter extends TypeAdapter<Range> {
  @override
  final int typeId = 5;

  @override
  Range read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Range(
      fields[0] as String,
      fields[1] as int,
      fields[2] as DistanceType,
    );
  }

  @override
  void write(BinaryWriter writer, Range obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.distanceType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RangeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
