// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeUnits.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeUnitsAdapter extends TypeAdapter<TimeUnits> {
  @override
  final int typeId = 14;

  @override
  TimeUnits read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TimeUnits.action;
      case 1:
        return TimeUnits.bonusAction;
      case 2:
        return TimeUnits.reaction;
      case 3:
        return TimeUnits.second;
      case 4:
        return TimeUnits.minute;
      case 5:
        return TimeUnits.hour;
      case 6:
        return TimeUnits.unknown;
      case 7:
        return TimeUnits.round;
      default:
        return TimeUnits.action;
    }
  }

  @override
  void write(BinaryWriter writer, TimeUnits obj) {
    switch (obj) {
      case TimeUnits.action:
        writer.writeByte(0);
        break;
      case TimeUnits.bonusAction:
        writer.writeByte(1);
        break;
      case TimeUnits.reaction:
        writer.writeByte(2);
        break;
      case TimeUnits.second:
        writer.writeByte(3);
        break;
      case TimeUnits.minute:
        writer.writeByte(4);
        break;
      case TimeUnits.hour:
        writer.writeByte(5);
        break;
      case TimeUnits.unknown:
        writer.writeByte(6);
        break;
      case TimeUnits.round:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeUnitsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
