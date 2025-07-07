import 'package:tavern_tome/data/spell/distanceType.dart';
import 'package:tavern_tome/generated/l10n.dart';
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

  Map<String, dynamic> toJson() =>{
    "type" : type,
    "amount" : amount,
    "distanceType" : distanceType.index,
  };

  Range.fromJson(Map<String, dynamic> json)
      : type = json["type"] as String,
        amount = json["amount"] as int,
        distanceType = DistanceType.values[json["distanceType"] as int];

  String inMeters(){
    switch(distanceType) {
      case DistanceType.feet:
        return S.current.meterForUi(((amount * 1.5) / 5.0).round());
      case DistanceType.meters:
        return S.current.meterForUi(amount);
      case DistanceType.self:
        return S.current.self;
      case DistanceType.miles:
        return S.current.mileForUi(amount / 1.6);
      case DistanceType.kilometers:
        return S.current.mileForUi(amount);
      case DistanceType.touch:
        return S.current.touch;
      case DistanceType.special:
        return S.current.special;
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
      case DistanceType.miles:
        return S.current.mileForUi(amount);
      case DistanceType.kilometers:
        return S.current.mileForUi(amount * 1.6);
      case DistanceType.touch:
        return S.current.touch;
      case DistanceType.special:
        return S.current.special;
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