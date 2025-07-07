// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'durationEndType.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DurationEndTypeAdapter extends TypeAdapter<DurationEndType> {
  @override
  final int typeId = 45;

  @override
  DurationEndType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DurationEndType.dispel;
      case 1:
        return DurationEndType.trigger;
      default:
        return DurationEndType.unknown;
    }
  }

  @override
  void write(BinaryWriter writer, DurationEndType obj) {
    switch (obj) {
      case DurationEndType.dispel:
        writer.writeByte(0);
        break;
      case DurationEndType.trigger:
        writer.writeByte(1);
        break;
      case DurationEndType.unknown:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DurationEndTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
