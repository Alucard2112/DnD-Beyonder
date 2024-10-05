// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dnd_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DnDClassAdapter extends TypeAdapter<DnDClass> {
  @override
  final int typeId = 18;

  @override
  DnDClass read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DnDClass.artificer;
      case 1:
        return DnDClass.barbarian;
      case 2:
        return DnDClass.bard;
      case 3:
        return DnDClass.cleric;
      case 4:
        return DnDClass.druid;
      case 5:
        return DnDClass.fighter;
      case 6:
        return DnDClass.monk;
      case 7:
        return DnDClass.paladin;
      case 8:
        return DnDClass.ranger;
      case 9:
        return DnDClass.rogue;
      case 10:
        return DnDClass.sorcerer;
      case 11:
        return DnDClass.warlock;
      case 12:
        return DnDClass.wizard;
      default:
        return DnDClass.artificer;
    }
  }

  @override
  void write(BinaryWriter writer, DnDClass obj) {
    switch (obj) {
      case DnDClass.artificer:
        writer.writeByte(0);
        break;
      case DnDClass.barbarian:
        writer.writeByte(1);
        break;
      case DnDClass.bard:
        writer.writeByte(2);
        break;
      case DnDClass.cleric:
        writer.writeByte(3);
        break;
      case DnDClass.druid:
        writer.writeByte(4);
        break;
      case DnDClass.fighter:
        writer.writeByte(5);
        break;
      case DnDClass.monk:
        writer.writeByte(6);
        break;
      case DnDClass.paladin:
        writer.writeByte(7);
        break;
      case DnDClass.ranger:
        writer.writeByte(8);
        break;
      case DnDClass.rogue:
        writer.writeByte(9);
        break;
      case DnDClass.sorcerer:
        writer.writeByte(10);
        break;
      case DnDClass.warlock:
        writer.writeByte(11);
        break;
      case DnDClass.wizard:
        writer.writeByte(12);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DnDClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
