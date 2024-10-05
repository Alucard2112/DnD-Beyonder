import 'package:dnd_beyonder/data/spell/distanceType.dart';
import 'package:dnd_beyonder/generated/l10n.dart';
import 'package:hive/hive.dart';

part 'range.g.dart';

@HiveType(typeId: 5)
class Range{
  @HiveField(0)
  final String type;
  @HiveField(1)
  final int amount;
  @HiveField(2)
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