enum TimeUnits{
  action,
  bonusAction,
  reaction,
  second,
  minute,
  hour,
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
      return "Aktion";
    case TimeUnits.bonusAction:
      return "Bonusaktion";
    case TimeUnits.reaction:
      return "Reaktion";
    case TimeUnits.second:
      return "Sekunde";
    case TimeUnits.minute:
      return "Minute";
    case TimeUnits.hour:
      return "Stunde";
    case TimeUnits.unknown:
      return "Unbekannt";
  }
}