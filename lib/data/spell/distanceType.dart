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
      return "Feet";
    case DistanceType.meters:
      return "Meter";
    case DistanceType.self:
      return "Selbst";
  }
}