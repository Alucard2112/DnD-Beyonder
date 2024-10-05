import 'package:hive/hive.dart';

import '../../generated/l10n.dart';

part 'dnd_class.g.dart';

@HiveType(typeId: 18)
enum DnDClass{
  @HiveField(0)
  artificer,
  @HiveField(1)
  barbarian,
  @HiveField(2)
  bard,
  @HiveField(3)
  cleric,
  @HiveField(4)
  druid,
  @HiveField(5)
  fighter,
  @HiveField(6)
  monk,
  @HiveField(7)
  paladin,
  @HiveField(8)
  ranger,
  @HiveField(9)
  rogue,
  @HiveField(10)
  sorcerer,
  @HiveField(11)
  warlock,
  @HiveField(12)
  wizard
}

String toDnDClassName(DnDClass c){
  switch(c){
    case DnDClass.artificer:
      return S.current.artificer;
    case DnDClass.barbarian:
      return S.current.barbarian;
    case DnDClass.bard:
      return S.current.bard;
    case DnDClass.cleric:
      return S.current.cleric;
    case DnDClass.druid:
      return S.current.druid;
    case DnDClass.fighter:
      return S.current.fighter;
    case DnDClass.monk:
      return S.current.monk;
    case DnDClass.paladin:
      return S.current.paladin;
    case DnDClass.ranger:
      return S.current.ranger;
    case DnDClass.rogue:
      return S.current.rogue;
    case DnDClass.sorcerer:
      return S.current.sorcerer;
    case DnDClass.warlock:
      return S.current.warlock;
    case DnDClass.wizard:
      return S.current.wizard;
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