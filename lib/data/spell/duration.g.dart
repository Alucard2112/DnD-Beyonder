// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duration.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DurationAdapter extends TypeAdapter<Duration> {
  @override
  final int typeId = 3;

  @override
  Duration read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Duration(
      fields[0] as DurationType,
      fields[1] as TimeUnits,
      fields[2] as int,
      fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Duration obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.unit)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.concentration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DurationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
