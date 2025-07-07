import 'package:tavern_tome/generated/l10n.dart';
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
  @HiveField(3)
  miles,
  @HiveField(4)
  kilometers,
  @HiveField(5)
  touch,
  @HiveField(6)
  special,
}

DistanceType distanceTypeFromString(String s){
  switch(s){
    case "feet":
      return DistanceType.feet;
    case "meters":
      return DistanceType.meters;
    case "miles":
      return DistanceType.miles;
    case "kilometers":
      return DistanceType.kilometers;
    case "touch":
      return DistanceType.touch;
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
    case DistanceType.miles:
      return S.current.mile;
    case DistanceType.kilometers:
      return S.current.km;
    case DistanceType.touch:
      return S.current.touch;
    case DistanceType.special:
      return "";
  }
}