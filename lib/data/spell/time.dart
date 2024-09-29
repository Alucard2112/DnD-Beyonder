import 'package:dnd_beyonder/data/spell/timeUnits.dart';

class Time{
  final int number;
  final TimeUnits unit;

  Time(this.number, this.unit);

  @override
  bool operator ==(Object other) {
    if(other is Time){
      return number == other.number && unit == other.unit;
    }
    return super == other;
  }

  @override
  String toString(){
    String timeString = "$number ${timeUnitToString(unit)}";
    if(number > 1 && (unit == TimeUnits.hour || unit == TimeUnits.minute)){
      timeString += "n";
    }
    return timeString;
  }

  @override
  int get hashCode => unit.hashCode + number.hashCode;

}