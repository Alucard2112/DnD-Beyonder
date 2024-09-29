import 'package:dnd_beyonder/data/spell/distanceType.dart';

class Range{
  final String type;
  final int amount;
  final DistanceType distanceType;

  Range(this.type, this.amount, this.distanceType);

  String inMeters(){
    switch(distanceType){
      case DistanceType.feet:
        return "${((amount * 1.5)/5.0).round()} ${distanceTypeToString(DistanceType.meters)}";
      default:
        return toString();
    }
  }

  @override
  String toString(){
    if(amount >= 0) {
      return "$amount ${distanceTypeToString(distanceType)}";
    }
    return distanceTypeToString(distanceType);
  }
}