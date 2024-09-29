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
      return "Bannmagie";
    case SpellSchool.transmutation:
      return "Verwandlung";
    case SpellSchool.conjuration:
      return "Beschwörung";
    case SpellSchool.divination:
      return "Erkenntnismagie";
    case SpellSchool.enchantment:
      return "Verzauberung";
    case SpellSchool.illusion:
      return "Illusion";
    case SpellSchool.evocation:
      return "Hervorrufung";
    case SpellSchool.necromancy:
      return "Nekromantie";
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