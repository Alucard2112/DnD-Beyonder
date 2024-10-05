// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damageType.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpellDamageTypeAdapter extends TypeAdapter<SpellDamageType> {
  @override
  final int typeId = 9;

  @override
  SpellDamageType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SpellDamageType.acid;
      case 1:
        return SpellDamageType.bludgeoning;
      case 2:
        return SpellDamageType.cold;
      case 3:
        return SpellDamageType.fire;
      case 4:
        return SpellDamageType.force;
      case 5:
        return SpellDamageType.lightning;
      case 6:
        return SpellDamageType.necrotic;
      case 7:
        return SpellDamageType.piercing;
      case 8:
        return SpellDamageType.poison;
      case 9:
        return SpellDamageType.psychic;
      case 10:
        return SpellDamageType.radiant;
      case 11:
        return SpellDamageType.slashing;
      case 12:
        return SpellDamageType.thunder;
      case 13:
        return SpellDamageType.shortbow;
      case 14:
        return SpellDamageType.longbow;
      case 15:
        return SpellDamageType.oneHandedMeleeAttacks;
      case 16:
        return SpellDamageType.unarmedAttacks;
      case 17:
        return SpellDamageType.naturalAttacks;
      case 18:
        return SpellDamageType.meleeWeaponAttacks;
      case 19:
        return SpellDamageType.thrownWeaponAttacks;
      default:
        return SpellDamageType.acid;
    }
  }

  @override
  void write(BinaryWriter writer, SpellDamageType obj) {
    switch (obj) {
      case SpellDamageType.acid:
        writer.writeByte(0);
        break;
      case SpellDamageType.bludgeoning:
        writer.writeByte(1);
        break;
      case SpellDamageType.cold:
        writer.writeByte(2);
        break;
      case SpellDamageType.fire:
        writer.writeByte(3);
        break;
      case SpellDamageType.force:
        writer.writeByte(4);
        break;
      case SpellDamageType.lightning:
        writer.writeByte(5);
        break;
      case SpellDamageType.necrotic:
        writer.writeByte(6);
        break;
      case SpellDamageType.piercing:
        writer.writeByte(7);
        break;
      case SpellDamageType.poison:
        writer.writeByte(8);
        break;
      case SpellDamageType.psychic:
        writer.writeByte(9);
        break;
      case SpellDamageType.radiant:
        writer.writeByte(10);
        break;
      case SpellDamageType.slashing:
        writer.writeByte(11);
        break;
      case SpellDamageType.thunder:
        writer.writeByte(12);
        break;
      case SpellDamageType.shortbow:
        writer.writeByte(13);
        break;
      case SpellDamageType.longbow:
        writer.writeByte(14);
        break;
      case SpellDamageType.oneHandedMeleeAttacks:
        writer.writeByte(15);
        break;
      case SpellDamageType.unarmedAttacks:
        writer.writeByte(16);
        break;
      case SpellDamageType.naturalAttacks:
        writer.writeByte(17);
        break;
      case SpellDamageType.meleeWeaponAttacks:
        writer.writeByte(18);
        break;
      case SpellDamageType.thrownWeaponAttacks:
        writer.writeByte(19);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpellDamageTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
