import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/spell/damageType.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/data/spell/spellSchool.dart';
import 'package:dnd_beyonder/data/spell/subclass.dart';
import 'package:dnd_beyonder/data/spell/time.dart';

import '../../generated/l10n.dart';

class SpellFilter{
  static final List<String> _categories = [S.current.filterClasses,S.current.filterLevel,S.current.filterCastTime,S.current.filterSchool,S.current.filterDamage];
  final Map<String, bool> categories = {};
  final Set<DnDClass> classFilter = {};
  final Set<SpellSchool> schoolFilter = {};
  final List<Time> castTimeFilter = [];
  final List<SpellDamageType> damageType = [];
  final Set<int> levelFilter ={};

  SpellFilter(){
    for(String category in _categories) {
      categories[category] = false;
    }
  }

  String getFilterText(){
    String ret = "";
    int count = _countFilters();
    if(count != 0){
      ret+=count.toString();
    }
    return ret;
  }

  int _countFilters(){
    int count = 0;
    count += classFilter.length;
    count += schoolFilter.length;
    count += damageType.length;
    count += castTimeFilter.length;
    count += levelFilter.length;
    return count;
  }

  void changeVisibility(int index){
    categories[_categories[index]] = !categories[_categories[index]]!;
  }

  bool showSubEntries(int index){
    return categories[_categories[index]]!;
  }

  int length(){
    return _categories.length;
  }

  String getCategory(int index){
    return _categories[index];
  }

  bool spellPasses(Spell spell, String searchText){
    if(!spell.name.toLowerCase().contains(searchText.toLowerCase())){
      return false;
    }
    if(levelFilter.isNotEmpty && !levelFilter.contains(spell.level)){
      return false;
    }
    if(castTimeFilter.isNotEmpty && !castTimeFilter.contains(spell.time)){
      return false;
    }
    if(damageType.isNotEmpty){
      bool passesDamage = false;
      for(SpellDamageType type in spell.damageInflict){
        passesDamage = passesDamage || damageType.contains(type);
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
    for(DnDClass classes in classFilter){
      if(classList.contains(classes)){
        return true;
      }
    }
    return classFilter.isEmpty;
  }

  void reset(){
    classFilter.clear();
    schoolFilter.clear();
    castTimeFilter.clear();
    levelFilter.clear();
    damageType.clear();
  }
}