import 'dart:core';

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
}