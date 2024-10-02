import '../../generated/l10n.dart';

class Components{
  final bool v;
  final bool s;
  final String m;

  Components(this.v, this.s, this.m);

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