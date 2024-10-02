import '../../generated/l10n.dart';

enum SpellDamageType{
  acid,
  bludgeoning,
  cold,
  fire,
  force,
  lightning,
  necrotic,
  piercing,
  poison,
  psychic,
  radiant,
  slashing,
  thunder,
  shortbow,
  longbow,
  oneHandedMeleeAttacks,
  unarmedAttacks,
  naturalAttacks,
  meleeWeaponAttacks,
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