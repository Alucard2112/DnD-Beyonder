import 'package:hive/hive.dart';

import '../../generated/l10n.dart';

part 'timeUnits.g.dart';

@HiveType(typeId: 14)
enum TimeUnits{
  @HiveField(0)
  action,
  @HiveField(1)
  bonusAction,
  @HiveField(2)
  reaction,
  @HiveField(3)
  second,
  @HiveField(4)
  minute,
  @HiveField(5)
  hour,
  @HiveField(6)
  unknown
}

TimeUnits timeUnitFromString(String s){
  switch(s.toLowerCase()){
    case "action":
      return TimeUnits.action;
    case "bonus":
      return TimeUnits.bonusAction;
    case "reaction":
      return TimeUnits.reaction;
    case "second":
      return TimeUnits.second;
    case "minute":
      return TimeUnits.minute;
    case "hour":
      return TimeUnits.hour;
    case "seconds":
      return TimeUnits.second;
    case "minutes":
      return TimeUnits.minute;
    case "hours":
      return TimeUnits.hour;
  }
  return TimeUnits.unknown;
}

String timeUnitToString(TimeUnits t){
  switch(t){
    case TimeUnits.action:
      return S.current.action(-1);
    case TimeUnits.bonusAction:
      return S.current.bonusAction(-1);
    case TimeUnits.reaction:
      return S.current.reaction(-1);
    case TimeUnits.second:
      return S.current.second(-1);
    case TimeUnits.minute:
      return S.current.minute(-1);
    case TimeUnits.hour:
      return S.current.hour(-1);
    case TimeUnits.unknown:
      return S.current.unknown;
  }
}