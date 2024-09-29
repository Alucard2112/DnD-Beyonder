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
      return "Säure";
    case SpellDamageType.bludgeoning:
      return "Wuchtschaden";
    case SpellDamageType.cold:
      return "Frost";
    case SpellDamageType.fire:
      return "Feuer";
    case SpellDamageType.force:
      return "Energie";
    case SpellDamageType.lightning:
      return "Blitz";
    case SpellDamageType.necrotic:
      return "Nekrotisch";
    case SpellDamageType.piercing:
      return "Stich";
    case SpellDamageType.poison:
      return "Gift";
    case SpellDamageType.psychic:
      return "Psychisch";
    case SpellDamageType.radiant:
      return "Gleißend";
    case SpellDamageType.slashing:
      return "Klinge";
    case SpellDamageType.thunder:
      return "Donner";
    case SpellDamageType.shortbow:
      return "Kurzbogen";
    case SpellDamageType.longbow:
      return "Langbogen";
    case SpellDamageType.oneHandedMeleeAttacks:
      return "Einhändige Nahkampfangriffe";
    case SpellDamageType.unarmedAttacks:
      return "Unbewaffnete Nahkampfangriffe";
    case SpellDamageType.naturalAttacks:
      return "Neutrale Angriffe";
    case SpellDamageType.meleeWeaponAttacks:
      return "Nahkampfangriffe";
    case SpellDamageType.thrownWeaponAttacks:
      return "Wurfwaffenangriffe";
  }
}