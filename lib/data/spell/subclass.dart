import 'dart:ui';

import 'package:hive/hive.dart';

import '../dnd/dnd_class.dart';

part 'subclass.g.dart';

@HiveType(typeId: 6)
class SubClasses{
  @HiveField(0)
  late final DnDClass c;
  @HiveField(1)
  late final Map<String,String> name;

  SubClasses(String clas, this.name){
    c = fromDnDClassName(clas);
  }



  @override
  int get hashCode => c.hashCode;

  String getName(Locale locale){
    if(name.containsKey(locale.languageCode)){
      return name[locale.languageCode]!;
    }
    return name["en"]!;
  }

  SubClasses.fromJson(Map<String, dynamic> json)
    : c = DnDClass.values[json["c"] as int],
      name = Map<String, String>.from(json["name"]);

  Map<String, dynamic> toJson() => {
    'c' : c.index,
    'name' : name,
  };

  SubClasses.fromHive(this.c, this.name);

  @override
  bool operator ==(Object other) {
    if(other is SubClasses){
      return c == other.c && name["en"] == other.name["en"];
    }
    return super == other;
  }

}