// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spellSchool.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpellSchoolAdapter extends TypeAdapter<SpellSchool> {
  @override
  final int typeId = 13;

  @override
  SpellSchool read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SpellSchool.abjuration;
      case 1:
        return SpellSchool.transmutation;
      case 2:
        return SpellSchool.conjuration;
      case 3:
        return SpellSchool.divination;
      case 4:
        return SpellSchool.enchantment;
      case 5:
        return SpellSchool.illusion;
      case 6:
        return SpellSchool.evocation;
      case 7:
        return SpellSchool.necromancy;
      default:
        return SpellSchool.abjuration;
    }
  }

  @override
  void write(BinaryWriter writer, SpellSchool obj) {
    switch (obj) {
      case SpellSchool.abjuration:
        writer.writeByte(0);
        break;
      case SpellSchool.transmutation:
        writer.writeByte(1);
        break;
      case SpellSchool.conjuration:
        writer.writeByte(2);
        break;
      case SpellSchool.divination:
        writer.writeByte(3);
        break;
      case SpellSchool.enchantment:
        writer.writeByte(4);
        break;
      case SpellSchool.illusion:
        writer.writeByte(5);
        break;
      case SpellSchool.evocation:
        writer.writeByte(6);
        break;
      case SpellSchool.necromancy:
        writer.writeByte(7);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpellSchoolAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
