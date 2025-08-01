import 'package:tavern_tome/generated/l10n.dart';
import 'package:hive/hive.dart';

part 'durationType.g.dart';

@HiveType(typeId: 11)
enum DurationType{
  @HiveField(0)
  instantaneous,
  @HiveField(1)
  timed,
  @HiveField(2)
  permanent
}

DurationType durationTypeFromString(String s){
  switch(s){
    case "timed":
      return DurationType.timed;
    case "instantaneous":
      return DurationType.instantaneous;
    case "permanent":
      return DurationType.permanent;
  }
  return DurationType.instantaneous;
}

String durationTypeToString(DurationType t){
  switch(t){
    case DurationType.instantaneous:
      return S.current.instantaneous;
    case DurationType.timed:
      return "";
    case DurationType.permanent:
      return "";
  }
}