class Components{
  final bool v;
  final bool s;
  final String m;

  Components(this.v, this.s, this.m);

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