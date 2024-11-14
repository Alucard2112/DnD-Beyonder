import 'package:dnd_beyonder/data/filter.dart';

import '../../generated/l10n.dart';
import '../dnd/dnd_class.dart';
import '../genericFilter.dart';
import 'character.dart';

class CharacterFilter extends Filter{
  final GenericFilter<DnDClass> _classFilter = GenericFilter(DnDClass.values, translate: toDnDClassName);
  static const String classFilter = "ClassFilter";

CharacterFilter() : super([classFilter],[true]);
  @override
  void fillMap(){
    filters[classFilter] = _classFilter;
  }

  @override
  bool objectPasses(object, String searchText) {
    Character character = object;
    if(character.name.contains(searchText)){
      return _classFilter.contains(character.dnDClass) || _classFilter.isEmpty();
    }
    return false;
  }

  @override
  String translateCategory(String category) {
    return S.current.filterClasses;
  }
}