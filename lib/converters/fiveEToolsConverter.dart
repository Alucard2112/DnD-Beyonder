import 'dart:core';

import '../generated/l10n.dart';

class FiveEToolsConverter {
  static String jsonToMD(dynamic s){
    if(s is Map<String, dynamic>){
      switch(s["type"]){
        case "entries":
          String entry = "**${s["name"]}**.";
          for(dynamic st in s["entries"]){
            entry+=jsonToMD(st);
          }
          return entry;
        case "list":
          String list = "";
          for(dynamic item in s["items"]){
            list+="- ${jsonToMD(item)}\n";
          }
          return list;
        case "table":
          String table = ("# ${s["caption"]}\n");
          String divider = "";
          for(String label in s["colLabels"]){
            table += "| $label ";
            divider += "| ----------- ";
          }
          table += "|\n$divider|\n";
          for(List<dynamic> row in s["rows"]){
            for(dynamic cell in row){
              table+= "| ${jsonToMD(cell)} ";
            }
            table+= "|\n";
          }
          return table;
        case "cell":
          if(s["roll"].containsKey("exact")){
            return "${s["roll"]["exact"]}";
          }
          return "${s["roll"]["min"]} - ${s["roll"]["max"]}";
        default:
          return "";

      }
    }
    else {
      return s.toString();
    }
  }

  static String translateAnnotations(String s){
    String ret = s;
    if(ret.contains("{@dice")){
      ret = _translateDice(ret);
    }
    return ret;
  }

  static String _translateDice(String s){
    String ret = s;
    RegExp exp = RegExp(r'"{@dice [0-9]*d[0-9]+}"');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      List<String> dieString = match.replaceAll("{@dice ", "").replaceAll("}", "").split("d");
      int? amount;
      if(dieString[0].isNotEmpty){
        amount = int.parse(dieString[0]);
      }
      int type = int.parse(dieString[1]);
      ret.replaceAll(match, _translateDiceHelper(amount, type));
    }
    return ret;
  }

  static String _translateDiceHelper(int? amount, int type){
    if(amount == null){
      return S.current.spellDetailDie(type);
    }
    return S.current.spellDetailDice(amount, type);
  }
}