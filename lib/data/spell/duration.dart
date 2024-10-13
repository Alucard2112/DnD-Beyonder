import 'package:dnd_beyonder/data/spell/durationType.dart';
import 'package:dnd_beyonder/data/spell/timeUnits.dart';
import 'package:hive/hive.dart';

import '../../generated/l10n.dart';

part 'duration.g.dart';

@HiveType(typeId: 3)
class Duration{
  @HiveField(0)
  final DurationType type;
  @HiveField(1)
  final TimeUnits unit;
  @HiveField(2)
  final int amount;
  @HiveField(3)
  final bool concentration;

  Duration(this.type, this.unit, this.amount, this.concentration);

  Map<String, dynamic> toJson() => {
    "type" : type.index,
    "unit" : unit.index,
    "amount" : amount,
    "concentration" : concentration,
  };

  Duration.fromJson(Map<String, dynamic> json)
    : type = DurationType.values[json["type"] as int],
      unit = TimeUnits.values[json["unit"] as int],
      amount = json["amount"] as int,
      concentration = json["concentration"] as bool;

  @override
  String toString() {
    if(type == DurationType.instantaneous){
      return durationTypeToString(type);
    }
    String s = _unitToString();
    if(concentration){
      s = "${S.current.concentration}, $s";
    }
    return s;
  }

  String _unitToString(){
    switch(unit){
      case TimeUnits.action:
        return S.current.action(amount);
      case TimeUnits.bonusAction:
        return S.current.bonusAction(amount);
      case TimeUnits.reaction:
        return S.current.reaction(amount);
      case TimeUnits.second:
        return S.current.second(amount);
      case TimeUnits.minute:
        return S.current.minute(amount);
      case TimeUnits.hour:
        return S.current.hour(amount);
      case TimeUnits.unknown:
        return S.current.unknown;
    }
  }
}