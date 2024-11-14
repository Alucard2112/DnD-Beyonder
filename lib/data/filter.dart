import 'genericFilter.dart';

abstract class Filter{
  late final List<String> filterCategories;
  late final List<bool> sort;
  final Map<String, bool> categories = {};
  final Map<String, GenericFilter> filters = {};

  void fillMap();

  String translateCategory(String category);

  bool objectPasses(dynamic object, String searchText);

  Filter(this.filterCategories, this.sort){
    for(String category in filterCategories) {
      categories[category] = false;
    }
    fillMap();
  }

  String getFilterText(){
    String ret = "";
    int count = countFilters();
    if(count != 0){
      ret+=count.toString();
    }
    return ret;
  }

  List getPossibleEntries(String filter){
    return getFilter(filter).possibleEntries;
  }
  String translateEntry(String filter, dynamic entry){
    return getFilter(filter).translateFunction(entry);
  }

  void changeVisibility(int index){
    categories[filterCategories[index]] = !categories[filterCategories[index]]!;
  }

  bool showSubEntries(int index){
    return categories[filterCategories[index]]!;
  }

  int length(){
    return filterCategories.length;
  }

  String getCategory(int index){
    return filterCategories[index];
  }

  int countFilters(){
    int count = 0;
    for(String filter in filterCategories){
      count+=getFilter(filter).length();
    }
    return count;
  }

  void reset(){
    for(GenericFilter filter in filters.values){
      filter.clear();
    }
  }

  void resetSingleFilter(String filter) {
    getFilter(filter).clear();
  }

  void updateFilter(String filter, value) {
    getFilter(filter).updateFilter(value);
  }

  GenericFilter getFilter(String filter){
    return filters[filter]!;
  }
}