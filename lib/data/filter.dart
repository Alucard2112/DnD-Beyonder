import 'genericFilter.dart';

abstract class Filter{
  late final List<String> filterCategories;
  final Map<String, bool> categories = {};

  Filter(this.filterCategories){
    for(String category in filterCategories) {
      categories[category] = false;
    }
  }

  String getFilterText(){
    String ret = "";
    int count = countFilters();
    if(count != 0){
      ret+=count.toString();
    }
    return ret;
  }

  List getPossibleEntries(String filter);
  String translateEntry(String filter, dynamic entry){
    return getFilter(filter).translateFunction(entry);
  }
  String translateCategory(String category);

  bool objectPasses(dynamic object, String searchText);

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
    for(String filter in filterCategories){
      getFilter(filter).clear();
    }
  }

  void resetSingleFilter(String filter) {
    getFilter(filter).clear();
  }

  void updateFilter(String filter, value) {
    getFilter(filter);
  }

  GenericFilter getFilter(String filter);
}