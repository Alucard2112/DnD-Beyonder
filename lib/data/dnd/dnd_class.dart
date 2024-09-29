enum DnDClass{
  artificer,
  barbarian,
  bard,
  cleric,
  druid,
  fighter,
  monk,
  paladin,
  ranger,
  rogue,
  sorcerer,
  warlock,
  wizard
}

String toDnDClassName(DnDClass c){
  switch(c){
    case DnDClass.artificer:
      return "Werkmeister";
    case DnDClass.barbarian:
      return "Barbar";
    case DnDClass.bard:
      return "Barde";
    case DnDClass.cleric:
      return "Kleriker";
    case DnDClass.druid:
      return "Druide";
    case DnDClass.fighter:
      return "Kämpfer";
    case DnDClass.monk:
      return "Mönch";
    case DnDClass.paladin:
      return "Paladin";
    case DnDClass.ranger:
      return "Waldläufer";
    case DnDClass.rogue:
      return "Schurke";
    case DnDClass.sorcerer:
      return "Magier";
    case DnDClass.warlock:
      return "Hexenmeister";
    case DnDClass.wizard:
      return "Zauberer";
  }
}

DnDClass fromDnDClassName(String s){
  switch(s.toLowerCase()){
    case "artificer" :
      return DnDClass.artificer;
    case "barbarian" :
      return DnDClass.barbarian;
    case "bard" :
      return DnDClass.bard;
    case "cleric" :
      return DnDClass.cleric;
    case "druid" :
      return DnDClass.druid;
    case "fighter" :
      return DnDClass.fighter;
    case "monk" :
      return DnDClass.monk;
    case "paladin" :
      return DnDClass.paladin;
    case "ranger" :
      return DnDClass.ranger;
    case "rogue" :
      return DnDClass.rogue;
    case "sorcerer" :
      return DnDClass.sorcerer;
    case "warlock" :
      return DnDClass.warlock;
    case "wizard" :
      return DnDClass.wizard;
  }
  return DnDClass.warlock;
}