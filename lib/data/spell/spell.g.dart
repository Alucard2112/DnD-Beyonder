// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpellAdapter extends TypeAdapter<Spell> {
  @override
  final int typeId = 1;

  @override
  Spell read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Spell(
      fields[0] as int,
      fields[1] as String,
      fields[2] as SourceBook,
      fields[3] as int,
      fields[4] as int,
      fields[5] as SpellSchool,
      (fields[10] as List).cast<String>(),
      fields[6] as Range,
      fields[8] as Components,
      fields[9] as Time,
      (fields[11] as List).cast<EntryHigherLevel>(),
      (fields[12] as List).cast<String>(),
      (fields[13] as List).cast<String>(),
      (fields[14] as Set).cast<DnDClass>(),
      (fields[15] as Set).cast<SubClasses>(),
      fields[7] as Duration,
      (fields[16] as List).cast<SpellDamageType>(),
    );
  }

  @override
  void write(BinaryWriter writer, Spell obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.source)
      ..writeByte(3)
      ..write(obj.page)
      ..writeByte(4)
      ..write(obj.level)
      ..writeByte(5)
      ..write(obj.school)
      ..writeByte(6)
      ..write(obj.range)
      ..writeByte(7)
      ..write(obj.duration)
      ..writeByte(8)
      ..write(obj.components)
      ..writeByte(9)
      ..write(obj.time)
      ..writeByte(10)
      ..write(obj.entries)
      ..writeByte(11)
      ..write(obj.entriesHigherLevel)
      ..writeByte(12)
      ..write(obj.conditionInflict)
      ..writeByte(13)
      ..write(obj.savingThrow)
      ..writeByte(14)
      ..write(obj.mainClasses.toList())
      ..writeByte(15)
      ..write(obj.subClasses.toList())
      ..writeByte(16)
      ..write(obj.damageInflict);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpellAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
