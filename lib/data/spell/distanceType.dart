import 'package:dnd_beyonder/generated/l10n.dart';
import 'package:hive/hive.dart';

part 'distanceType.g.dart';

@HiveType(typeId: 10)
enum DistanceType{
  @HiveField(0)
  feet,
  @HiveField(1)
  meters,
  @HiveField(2)
  self,
}

DistanceType distanceTypeFromString(String s){
  switch(s){
    case "feet":
      return DistanceType.feet;
    case "meters":
      return DistanceType.meters;
    case "self":
      return DistanceType.self;
  }
  return DistanceType.feet;
}

String distanceTypeToString(DistanceType type){
  switch(type){
    case DistanceType.feet:
      return S.current.feet;
    case DistanceType.meters:
      return S.current.meter;
    case DistanceType.self:
      return S.current.self;
  }
}