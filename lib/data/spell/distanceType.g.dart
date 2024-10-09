// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distanceType.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DistanceTypeAdapter extends TypeAdapter<DistanceType> {
  @override
  final int typeId = 10;

  @override
  DistanceType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DistanceType.feet;
      case 1:
        return DistanceType.meters;
      case 2:
        return DistanceType.self;
      default:
        return DistanceType.feet;
    }
  }

  @override
  void write(BinaryWriter writer, DistanceType obj) {
    switch (obj) {
      case DistanceType.feet:
        writer.writeByte(0);
        break;
      case DistanceType.meters:
        writer.writeByte(1);
        break;
      case DistanceType.self:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DistanceTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}