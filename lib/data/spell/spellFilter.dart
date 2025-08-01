import 'dart:ui';

import 'package:tavern_tome/data/dnd/dnd_class.dart';
import 'package:tavern_tome/data/filter.dart';
import 'package:tavern_tome/data/spell/damageType.dart';
import 'package:tavern_tome/data/spell/spell.dart';
import 'package:tavern_tome/data/spell/spellSchool.dart';
import 'package:tavern_tome/data/spell/subclass.dart';
import 'package:tavern_tome/data/spell/time.dart';
import 'package:tavern_tome/data/spell/timeUnits.dart';
import 'package:tavern_tome/permanentData/settings.dart';

import '../../generated/l10n.dart';
import '../genericFilter.dart';

class SpellFilter extends Filter{
  final GenericFilter<DnDClass> _classFilter = GenericFilter(DnDClass.values, translate: toDnDClassName);
  final GenericFilter<SpellSchool> _schoolFilter = GenericFilter(SpellSchool.values, translate: spellSchoolToString);
  final GenericFilter<Time> _castTimeFilter = GenericFilter(
    [Time(1, TimeUnits.action),
    Time(1, TimeUnits.bonusAction),
    Time(1, TimeUnits.reaction),
    Time(1, TimeUnits.minute),
    Time(10, TimeUnits.minute),
    Time(1, TimeUnits.hour),
    Time(8, TimeUnits.hour),
    Time(12, TimeUnits.hour),
    Time(24, TimeUnits.hour),],);
  final GenericFilter<SpellDamageType> _damageTypeFilter = GenericFilter(SpellDamageType.values, translate: spellDamageTypeToName);
  final GenericFilter<int> _levelFilter = GenericFilter([0,1,2,3,4,5,6,7,8,9], translate: _translateLvl);

  static String _translateLvl(lvl){
    return S.current.spellLevel(lvl);
  }

  static const String classFilter = "ClassFilter";
  static const String schoolFilter = "SchoolFilter";
  static const String castTimeFilter = "CastTimeFilter";
  static const String damageTypeFilter = "DamageTypeFilter";
  static const String levelFilter = "LevelFilter";

  @override
  void fillMap(){
    filters[classFilter] = _classFilter;
    filters[schoolFilter] = _schoolFilter;
    filters[castTimeFilter] = _castTimeFilter;
    filters[damageTypeFilter] = _damageTypeFilter;
    filters[levelFilter] = _levelFilter;
  }

  SpellFilter() : super(
      [classFilter, schoolFilter, castTimeFilter, damageTypeFilter, levelFilter],
      [true, true, false, true, false]);

  SpellFilter.character() : super(
      [schoolFilter, castTimeFilter, damageTypeFilter, levelFilter],
      [true, false, true, false]);

  @override
  bool objectPasses(object, String searchText) {
    Spell spell = object;
    if(Settings.locale == Locale("en")){
      if(!spell.getName().toLowerCase().contains(searchText.toLowerCase())){
        return false;
      }
    }
    else{
      if(!spell.getName().toLowerCase().contains(searchText.toLowerCase()) && !spell.name["en"]!.toLowerCase().contains(searchText.toLowerCase())){
        return false;
      }
    }
    if(_schoolFilter.isNotEmpty() && !_schoolFilter.contains(spell.school)){
      return false;
    }
    if(_levelFilter.isNotEmpty() && !_levelFilter.contains(spell.level)){
      return false;
    }
    if(_castTimeFilter.isNotEmpty() && !_castTimeFilter.contains(spell.time)){
      return false;
    }
    if(_damageTypeFilter.isNotEmpty()){
      bool passesDamage = false;
      for(SpellDamageType type in spell.damageInflict){
        passesDamage = passesDamage || _damageTypeFilter.contains(type);
      }
      if(!passesDamage){
        return false;
      }
    }
    Set<DnDClass> classList = {};
    classList.addAll(spell.mainClasses);
    for(SubClasses subClasses in spell.subClasses){
      classList.add(subClasses.c);
    }
    for(DnDClass classes in classList){
      if(_classFilter.contains(classes)){
        return true;
      }
    }
    return _classFilter.isEmpty();
  }

  @override
  String translateCategory(String category) {
    switch(category){
      case classFilter:
        return S.current.filterClasses;
      case schoolFilter:
        return S.current.filterSchool;
      case castTimeFilter:
        return S.current.filterCastTime;
      case damageTypeFilter:
        return S.current.filterDamage;
      default:
        return S.current.filterLevel;
    }
  }
}