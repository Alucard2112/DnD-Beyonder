import 'package:dnd_beyonder/data/spell/durationType.dart';
import 'package:dnd_beyonder/data/spell/timeUnits.dart';

class Duration{
  final DurationType type;
  late final TimeUnits unit;
  late final int amount;

  Duration(this.type, this.unit, this.amount);

  @override
  String toString() {
    if(type == DurationType.instantaneous){
      return durationTypeToString(type);
    }
    if(amount > 1){
      return "$amount ${timeUnitToString(unit)}n";
    }
    return "$amount ${timeUnitToString(unit)}";
  }
}