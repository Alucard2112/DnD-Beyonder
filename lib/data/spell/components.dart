import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Components{
  final bool v;
  final bool s;
  final String m;

  Components(this.v, this.s, this.m);

  String forUi(BuildContext context){
    String ret = "";
    if(v){
      ret+="${AppLocalizations.of(context)!.verbal}, ";
    }
    if(s){
      ret+="${AppLocalizations.of(context)!.somatic}, ";
    }
    if(m.isNotEmpty){
      ret+="${AppLocalizations.of(context)!.material}, ";
    }
    return ret.substring(0,ret.length-2);
  }

  @override
  String toString(){
    String ret = "";
    if(v){
      ret+="Verbal, ";
    }
    if(s){
      ret+="Geste, ";
    }
    if(m.isNotEmpty){
      ret+="Material, ";
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