import 'package:hive_flutter/hive_flutter.dart';

part 'componentUsedUp.g.dart';

@HiveType(typeId: 33)
enum ComponentUsedUp{
  @HiveField(0)
  affirmative,
  @HiveField(1)
  negative,
  @HiveField(2)
  optional
}

ComponentUsedUp componentUsedUpFromDynamic(dynamic json){
  if(json == null){
    return ComponentUsedUp.negative;
  }
  if(json is bool){
    if(json){
      return ComponentUsedUp.affirmative;
    }
    return ComponentUsedUp.negative;
  }
  return ComponentUsedUp.optional;
}