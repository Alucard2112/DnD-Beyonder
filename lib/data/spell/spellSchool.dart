import 'package:dnd_beyonder/generated/l10n.dart';

enum SpellSchool{
  abjuration,
  transmutation,
  conjuration,
  divination,
  enchantment,
  illusion,
  evocation,
  necromancy
}

String spellSchoolToString(SpellSchool school){
  switch(school){
    case SpellSchool.abjuration:
      return S.current.abjuration;
    case SpellSchool.transmutation:
      return S.current.transmutation;
    case SpellSchool.conjuration:
      return S.current.conjuration;
    case SpellSchool.divination:
      return S.current.divination;
    case SpellSchool.enchantment:
      return S.current.enchantment;
    case SpellSchool.illusion:
      return S.current.illusion;
    case SpellSchool.evocation:
      return S.current.evocation;
    case SpellSchool.necromancy:
      return S.current.necromancy;
  }
}

SpellSchool getSpellSchoolFromJson(String s){
  switch(s){
    case "A":
      return SpellSchool.abjuration;
    case "T" :
      return SpellSchool.transmutation;
    case "C" :
      return SpellSchool.conjuration;
    case "D" :
      return SpellSchool.divination;
    case "E" :
      return SpellSchool.enchantment;
    case "I" :
      return SpellSchool.illusion;
    case "V" :
      return SpellSchool.evocation;
    case "N" :
      return SpellSchool.necromancy;
  }
  return SpellSchool.necromancy;
}

String getIconNameFromSchool(SpellSchool school){
  return school.name;
}