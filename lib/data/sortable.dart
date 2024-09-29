import 'gui/sorting.dart';

abstract mixin class Sortable<T>{
  static int sortFunction(Sortable a, Sortable b, Sorting sorting, bool asc) {
    int mult = -1;
    if (asc) {
      mult = 1;
    }
    switch (sorting) {
      case Sorting.name:
        return mult * a.sortName(b);
      case Sorting.level:
        return mult * a.sortLevel(b);
      case Sorting.dndClass:
        return mult * a.sortDnDClass(b);
      case Sorting.school:
        return mult * a.sortSchool(b);
      case Sorting.attackType:
        return mult * a.sortAttackType(b);
      case Sorting.source:
        return mult * a.sortSource(b);
      case Sorting.spellCount:
        return mult * a.sortSpellCount(b);
    }
  }

  int sortName(T b){
    return 0;
  }

  int sortLevel(T b){
    return 0;
  }

  int sortDnDClass(T b){
    return 0;
  }

  int sortSchool(T b){
    return 0;
  }

  int sortAttackType(T b){
    return 0;
  }

  int sortSource(T b){
    return 0;
  }

  int sortSpellCount(T b){
    return 0;
  }

}