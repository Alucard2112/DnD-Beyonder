
import 'package:hive_flutter/hive_flutter.dart';

import '../../generated/l10n.dart';

part 'damageType.g.dart';

@HiveType(typeId: 9)
enum SpellDamageType{
  @HiveField(0)
  acid,
  @HiveField(1)
  bludgeoning,
  @HiveField(2)
  cold,
  @HiveField(3)
  fire,
  @HiveField(4)
  force,
  @HiveField(5)
  lightning,
  @HiveField(6)
  necrotic,
  @HiveField(7)
  piercing,
  @HiveField(8)
  poison,
  @HiveField(9)
  psychic,
  @HiveField(10)
  radiant,
  @HiveField(11)
  slashing,
  @HiveField(12)
  thunder,
  @HiveField(13)
  shortbow,
  @HiveField(14)
  longbow,
  @HiveField(15)
  oneHandedMeleeAttacks,
  @HiveField(16)
  unarmedAttacks,
  @HiveField(17)
  naturalAttacks,
  @HiveField(18)
  meleeWeaponAttacks,
  @HiveField(19)
  thrownWeaponAttacks
}

SpellDamageType convertFromString(String s){
  const values = SpellDamageType.values;
  for(int i = 0; i < values.length; i++){
    String entry = values[i].name;
    if(entry.toLowerCase() == s.toLowerCase()){
      return values[i];
    }
  }
  return SpellDamageType.unarmedAttacks;
}

String spellDamageTypeToName(SpellDamageType type){
  switch(type){
    case SpellDamageType.acid:
      return S.current.acid;
    case SpellDamageType.bludgeoning:
      return S.current.bludgeoning;
    case SpellDamageType.cold:
      return S.current.cold;
    case SpellDamageType.fire:
      return S.current.fire;
    case SpellDamageType.force:
      return S.current.force;
    case SpellDamageType.lightning:
      return S.current.lightning;
    case SpellDamageType.necrotic:
      return S.current.necrotic;
    case SpellDamageType.piercing:
      return S.current.piercing;
    case SpellDamageType.poison:
      return S.current.poison;
    case SpellDamageType.psychic:
      return S.current.psychic;
    case SpellDamageType.radiant:
      return S.current.radiant;
    case SpellDamageType.slashing:
      return S.current.slashing;
    case SpellDamageType.thunder:
      return S.current.thunder;
    case SpellDamageType.shortbow:
      return S.current.shortbow;
    case SpellDamageType.longbow:
      return S.current.longbow;
    case SpellDamageType.oneHandedMeleeAttacks:
      return S.current.oneHandedMeleeAttacks;
    case SpellDamageType.unarmedAttacks:
      return S.current.unarmedAttacks;
    case SpellDamageType.naturalAttacks:
      return S.current.naturalAttacks;
    case SpellDamageType.meleeWeaponAttacks:
      return S.current.meleeWeaponAttacks;
    case SpellDamageType.thrownWeaponAttacks:
      return S.current.thrownWeaponAttacks;
  }
}