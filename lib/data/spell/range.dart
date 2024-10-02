import 'package:dnd_beyonder/data/spell/distanceType.dart';
import 'package:dnd_beyonder/generated/l10n.dart';

class Range{
  final String type;
  final int amount;
  final DistanceType distanceType;

  Range(this.type, this.amount, this.distanceType);

  String inMeters(){
    switch(distanceType) {
      case DistanceType.feet:
        return S.current.meterForUi(((amount * 1.5) / 5.0).round());
      case DistanceType.meters:
        return S.current.meterForUi(amount);
      case DistanceType.self:
        return S.current.self;
    }
  }

  String inFeet(){
    switch(distanceType) {
      case DistanceType.feet:
        return S.current.feetForUi(amount);
      case DistanceType.meters:
        return S.current.feetForUi(((amount * 5) / 1.5).round());
      case DistanceType.self:
        return S.current.self;
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