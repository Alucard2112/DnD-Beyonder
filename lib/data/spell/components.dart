import 'package:hive/hive.dart';

import '../../generated/l10n.dart';

part 'components.g.dart';

@HiveType(typeId: 2)
class Components{
  @HiveField(0)
  final bool v;
  @HiveField(1)
  final bool s;
  @HiveField(2)
  final String m;

  Components(this.v, this.s, this.m);

  Map<String, dynamic> toJson() => {
    "v":v,
    "s":s,
    "m":m,
  };

  Components.fromJson(Map<String, dynamic> json)
    : v = json["v"] as bool,
      s = json["s"] as bool,
      m = json["m"] as String;

  @override
  String toString(){
    String ret = "";
    if(v){
      ret+="${S.current.verbal}, ";
    }
    if(s){
      ret+="${S.current.somatic}, ";
    }
    if(m.isNotEmpty){
      ret+="${S.current.material}, ";
    }
    return ret.substring(0,ret.length-2);
  }

  String material(){
    if(m.isNotEmpty){
      return " ($m)";
    }
    return "";
  }
}