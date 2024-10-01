import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

String spellDamageTypeToName(SpellDamageType type, BuildContext context){
  switch(type){
    case SpellDamageType.acid:
      return AppLocalizations.of(context)!.acid;
    case SpellDamageType.bludgeoning:
      return AppLocalizations.of(context)!.bludgeoning;
    case SpellDamageType.cold:
      return AppLocalizations.of(context)!.cold;
    case SpellDamageType.fire:
      return AppLocalizations.of(context)!.fire;
    case SpellDamageType.force:
      return AppLocalizations.of(context)!.force;
    case SpellDamageType.lightning:
      return AppLocalizations.of(context)!.lightning;
    case SpellDamageType.necrotic:
      return AppLocalizations.of(context)!.necrotic;
    case SpellDamageType.piercing:
      return AppLocalizations.of(context)!.piercing;
    case SpellDamageType.poison:
      return AppLocalizations.of(context)!.poison;
    case SpellDamageType.psychic:
      return AppLocalizations.of(context)!.psychic;
    case SpellDamageType.radiant:
      return AppLocalizations.of(context)!.radiant;
    case SpellDamageType.slashing:
      return AppLocalizations.of(context)!.slashing;
    case SpellDamageType.thunder:
      return AppLocalizations.of(context)!.thunder;
    case SpellDamageType.shortbow:
      return AppLocalizations.of(context)!.shortbow;
    case SpellDamageType.longbow:
      return AppLocalizations.of(context)!.longbow;
    case SpellDamageType.oneHandedMeleeAttacks:
      return AppLocalizations.of(context)!.oneHandedMeleeAttacks;
    case SpellDamageType.unarmedAttacks:
      return AppLocalizations.of(context)!.unarmedAttacks;
    case SpellDamageType.naturalAttacks:
      return AppLocalizations.of(context)!.naturalAttacks;
    case SpellDamageType.meleeWeaponAttacks:
      return AppLocalizations.of(context)!.meleeWeaponAttacks;
    case SpellDamageType.thrownWeaponAttacks:
      return AppLocalizations.of(context)!.thrownWeaponAttacks;
  }
}