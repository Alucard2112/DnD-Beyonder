import 'package:dnd_beyonder/generated/l10n.dart';

enum DistanceType{
  feet,
  meters,
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