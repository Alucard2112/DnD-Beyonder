import 'package:dnd_beyonder/generated/l10n.dart';

enum DurationType{
  instantaneous,
  timed
}

DurationType durationTypeFromString(String s){
  switch(s){
    case "timed":
      return DurationType.timed;
    case "instantaneous":
      return DurationType.instantaneous;
  }
  return DurationType.instantaneous;
}

String durationTypeToString(DurationType t){
  switch(t){
    case DurationType.instantaneous:
      return S.current.instantaneous;
    case DurationType.timed:
      return "";
  }
}