class GenericFilter<T>{
  final List<T> filter = [];
  final List<T> possibleEntries;
  late final String Function(T entry) translateFunction;

  GenericFilter(this.possibleEntries, {String Function(T entry)? translate}){
    this.translateFunction = translate ?? (T entry){return entry.toString();};
  }

  String translate(dynamic entry){
    T value = entry;
    return translateFunction(value);
  }

  void updateFilter(T value){
    if(filter.contains(value)){
      filter.remove(value);
    }
    else{
      filter.add(value);
    }
  }

  bool contains(T entry){
    return filter.contains(entry);
  }

  int length(){
    return filter.length;
  }

  void clear(){
    filter.clear();
  }

  bool isNotEmpty(){
    return filter.isNotEmpty;
  }

  bool isEmpty(){
    return filter.isEmpty;
  }
}