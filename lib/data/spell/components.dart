import 'dart:ui';

import 'package:dnd_beyonder/data/spell/componentUsedUp.dart';
import 'package:hive/hive.dart';

import '../../generated/l10n.dart';
import '../../permanentData/settings.dart';

part 'components.g.dart';

@HiveType(typeId: 2)
class Components{
  @HiveField(0)
  final bool v;
  @HiveField(1)
  final bool s;
  @HiveField(2)
  final Map<String,String> m;
  @HiveField(3)
  final ComponentUsedUp usedUp;

  Components(this.v, this.s, this.m, this.usedUp);

  Map<String, dynamic> toJson() => {
    "v":v,
    "s":s,
    "m":m,
    "usedUp": usedUp.index,
  };

  Components.fromJson(Map<String, dynamic> json)
    : v = json["v"] as bool,
      s = json["s"] as bool,
      m = json["m"] as Map<String, String>,
      usedUp = ComponentUsedUp.values[json["usedUp"] as int];

  @override
  String toString(){
    String ret = "";
    if(v){
      ret+="${S.current.verbal}, ";
    }
    if(s){
      ret+="${S.current.somatic}, ";
    }
    String material = m["en"]!;
    if(material.isNotEmpty){
      ret+="${S.current.material}, ";
    }
    return ret.substring(0,ret.length-2);
  }

  String material(){
    String material = "";
    Locale locale = Settings.locale!;
    if(m.containsKey(locale.languageCode)){
      material = m[locale.languageCode]!;
    }
    else{
      material = m["en"]!;
    }
    return material.isEmpty ? "" : "($material)";
  }
}