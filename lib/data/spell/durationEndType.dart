import 'package:hive/hive.dart';

import '../../generated/l10n.dart';

part 'durationEndType.g.dart';

@HiveType(typeId: 45)
enum DurationEndType{
  @HiveField(0)
  dispel,
  @HiveField(1)
  trigger,
  @HiveField(2)
  unknown
}

DurationEndType durationEndTypeFromString(String s){
  switch(s){
    case "trigger":
      return DurationEndType.trigger;
    case "dispel":
      return DurationEndType.dispel;
  }
  return DurationEndType.unknown;
}

String durationEndTypeToString(DurationEndType d){
  switch(d){
    case DurationEndType.dispel:
      return S.current.dispel;
    case DurationEndType.trigger:
      return S.current.trigger;
    case DurationEndType.unknown:
      return S.current.unknown;
  }
}