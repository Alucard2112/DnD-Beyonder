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
      return "Name";
    case Sorting.level:
      return "Zaubergrad";
    case Sorting.school:
      return "Zauberschule";
    case Sorting.attackType:
      return "Schadenstyp";
    case Sorting.source:
      return "Quelle";
    case Sorting.dndClass:
      return "Klasse";
    case Sorting.spellCount:
      return "Anzahl Zauber";
  }
}