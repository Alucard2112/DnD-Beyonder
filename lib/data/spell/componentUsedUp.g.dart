// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'componentUsedUp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComponentUsedUpAdapter extends TypeAdapter<ComponentUsedUp> {
  @override
  final int typeId = 33;

  @override
  ComponentUsedUp read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ComponentUsedUp.affirmative;
      case 1:
        return ComponentUsedUp.negative;
      case 2:
        return ComponentUsedUp.optional;
      default:
        return ComponentUsedUp.affirmative;
    }
  }

  @override
  void write(BinaryWriter writer, ComponentUsedUp obj) {
    switch (obj) {
      case ComponentUsedUp.affirmative:
        writer.writeByte(0);
        break;
      case ComponentUsedUp.negative:
        writer.writeByte(1);
        break;
      case ComponentUsedUp.optional:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComponentUsedUpAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
