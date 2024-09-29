import '../dnd/dnd_class.dart';

class SubClasses{
  late final DnDClass c;
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