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
  late final TimeUnits unit;
  @HiveField(2)
  late final int amount;

  Duration(this.type, this.unit, this.amount);

  @override
  String toString() {
    if(type == DurationType.instantaneous){
      return durationTypeToString(type);
    }
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