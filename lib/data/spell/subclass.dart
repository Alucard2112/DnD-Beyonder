import 'package:hive/hive.dart';

import '../dnd/dnd_class.dart';

part 'subclass.g.dart';

@HiveType(typeId: 6)
class SubClasses{
  @HiveField(0)
  late final DnDClass c;
  @HiveField(1)
  late final String name;

  SubClasses(String clas, this.name){
    c = fromDnDClassName(clas);
  }

  @override
  bool operator ==(Object other) {
    if(other is SubClasses){
      return c == other.c && name == other.name;
    }
    return super == other;
  }

  @override
  int get hashCode => name.hashCode + c.hashCode;

}