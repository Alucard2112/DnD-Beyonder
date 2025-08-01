import 'package:tavern_tome/data/spell/timeUnits.dart';
import 'package:tavern_tome/generated/l10n.dart';
import 'package:hive/hive.dart';

part 'time.g.dart';

@HiveType(typeId: 7)
class Time{
  @HiveField(0)
  final int number;
  @HiveField(1)
  final TimeUnits unit;

  Time(this.number, this.unit);

  Map<String, dynamic> toJson() => {
    "number" : number,
    "unit" : unit.index,
  };

  Time.fromJson(Map<String, dynamic> json)
    : number = json["number"] as int,
      unit = TimeUnits.values[json["unit"] as int];

  @override
  bool operator ==(Object other) {
    if(other is Time){
      return number == other.number && unit == other.unit;
    }
    return super == other;
  }

  @override
  String toString(){
    switch(unit){
      case TimeUnits.action:
        return S.current.action(number);
      case TimeUnits.bonusAction:
        return S.current.bonusAction(number);
      case TimeUnits.reaction:
        return S.current.reaction(number);
      case TimeUnits.second:
        return S.current.second(number);
      case TimeUnits.minute:
        return S.current.minute(number);
      case TimeUnits.hour:
        return S.current.hour(number);
      case TimeUnits.unknown:
        return S.current.unknown;
      case TimeUnits.round:
        return S.current.round(number);
    }
  }

  @override
  int get hashCode => unit.hashCode + number.hashCode;

}