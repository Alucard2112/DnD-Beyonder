// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spellbook.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpellBookAdapter extends TypeAdapter<SpellBook> {
  @override
  final int typeId = 8;

  @override
  SpellBook read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpellBook(
      id: fields[3] as int,
      dnDClass: fields[0] as DnDClass,
      name: fields[1] as String,
      spellIds: (fields[2] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, SpellBook obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.dnDClass)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.spellIds)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpellBookAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
