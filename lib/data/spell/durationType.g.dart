// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'durationType.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DurationTypeAdapter extends TypeAdapter<DurationType> {
  @override
  final int typeId = 11;

  @override
  DurationType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DurationType.instantaneous;
      case 1:
        return DurationType.timed;
      default:
        return DurationType.instantaneous;
    }
  }

  @override
  void write(BinaryWriter writer, DurationType obj) {
    switch (obj) {
      case DurationType.instantaneous:
        writer.writeByte(0);
        break;
      case DurationType.timed:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DurationTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
