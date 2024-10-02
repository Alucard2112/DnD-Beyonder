import 'package:dnd_beyonder/generated/l10n.dart';

enum Sorting{
  name,
  level,
  dndClass,
  school,
  attackType,
  source,
  spellCount,
}

String sortingToString(Sorting sorting){
  switch(sorting){
    case Sorting.name:
      return S.current.name;
    case Sorting.level:
      return S.current.level;
    case Sorting.school:
      return S.current.school;
    case Sorting.attackType:
      return S.current.attackType;
    case Sorting.source:
      return S.current.source;
    case Sorting.dndClass:
      return S.current.dndClass;
    case Sorting.spellCount:
      return S.current.spellCount;
  }
}