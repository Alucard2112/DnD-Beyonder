import 'dart:core';

import 'package:dnd_beyonder/permanentData/boxHandler.dart';

import '../data/spell/spell.dart';
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
    if(ret.contains("{@")){
      ret = _translateGeneric(ret);
    }
    if(ret.contains("{@note")){
      ret = _translateNote(ret);
    }
    return ret;
  }

  static String _translateGeneric(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@[^}]+}'); //RegExp(r'{@[0-9a-zA-Z| \(\)\[\];&]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String start = match.substring(match.indexOf("@")+1, match.indexOf(" "));
      String replace = match;
      switch(start){
        case "dice":
          replace = _translateDamage(match);
          break;
        case "damage":
          replace = _translateDamage(match);
          break;
        case "condition":
          replace = _translateCondition(match);
          break;
        case "creature":
          replace = _translateCreature(match);
          break;
        case "hit":
          replace = _translateHit(match);
          break;
        case "spell":
          replace = _translateSpell(match);
          break;
        case "sense":
          replace = _translateSenses(match);
          break;
        case "d20":
          replace = _translated20(match);
          break;
        case "action":
          replace = _translateAction(match);
          break;
        case "skill":
          replace = _translateSkills(match);
          break;
        case "race":
          replace = _translateSpecies(match);
          break;
        case "status":
          replace = _translateStatus(match);
          break;
        case "quickref":
          replace = _translateQuickref(match);
          break;
        case "item":
          replace = _translateItems(match);
          break;
        case "scaledamage":
          replace = _translateScaledamage(match);
          break;
        case "filter":
          replace = _translateFilter(match);
          break;
        default:
          replace = match.substring(match.indexOf(" ")+1).replaceAll("}", "");
          if(replace.contains("|")){
            replace = replace.substring(replace.lastIndexOf("|"));
          }
          replace = replace.substring(0, replace.indexOf("|"));
      }
      ret = ret.replaceAll(match, replace);
    }
    return ret;
  }

  static String _translateNote(String s){
    String ret = s;
    RegExp exp = RegExp(r"{@note [0-9a-zA-Z|' \[\];&]+}");
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.substring(match.indexOf(" ")+1).replaceAll("}", "");
      ret = ret.replaceAll(match, hit);
    }
    return ret;
  }

  static String _translateFilter(String s){
    String hit = s.substring(s.indexOf(" ")+1).replaceAll("}", "");
    if(hit.contains("|")){
      hit = hit.substring(0,hit.indexOf("|"));
    }
    return hit;
  }

  static String _translateScaledamage(String s){
    String hit = s.replaceAll("}", "");
    String dieString = hit.substring(hit.lastIndexOf("|"));
    List<String> split = dieString.split("d");
    int type = int.parse(split[1].trim());
    int amount = int.parse(split[0].trim());
    return _translateDiceHelper(amount, type);
  }

  static String _translateItems(String s){
      String hit = s.replaceAll("{@item ", "").replaceAll("}", "");
      return hit.substring(hit.lastIndexOf("|"));
  }

  static String _translateQuickref(String s){
      String hit = s.replaceAll("{@quickref ", "").replaceAll("}", "");
      String replace = "";
      if(hit.toLowerCase().contains("cover")){
        replace = S.current.cover(hit.substring(hit.lastIndexOf("|")+1).toLowerCase().trim().replaceAll(RegExp(r"\W"), "_"));
      }
      else if(hit.toLowerCase().contains("vision")){
        replace = S.current.visibility(hit.substring(hit.lastIndexOf("|")+1).toLowerCase().trim().replaceAll(RegExp(r"\W"), "_"));
      }
      else{
        replace = S.current.difficultTerrain;
      }
      return replace;
  }

  static String _translateStatus(String s){
      String hit = s.replaceAll("{@status ", "").replaceAll("}", "");
      if(hit.contains("|")){
        hit = hit.substring(0, hit.indexOf("|"));
      }
      return "*${S.current.status(hit.toLowerCase().trim().replaceAll(RegExp(r"\W"), "_"))}*";
  }

  static String _translateSpecies(String s){
      String hit = s.replaceAll("{@race ", "").replaceAll("}", "");
      if(hit.contains("|")){
        hit = hit.substring(0,hit.indexOf("|"));
        hit = hit.replaceAll(" ", "");
      }
      String speciesString = hit.toLowerCase().trim().replaceAll(RegExp(r"\W"), "_");
      while(speciesString.endsWith("_")){
        speciesString = speciesString.substring(0, hit.length-1);
      }
      print(speciesString);
      return "*${S.current.species(speciesString)}*";
  }

  static String _translateSkills(String s){
      String hit = s.replaceAll("{@skill ", "").replaceAll("}", "");
      return "*${S.current.skills(hit.toLowerCase().trim().replaceAll(" ", "_"))}*";
  }

  static String _translateSenses(String s){
      String hit = s.replaceAll("{@sense ", "").replaceAll("}", "");
      return "*${S.current.senses(hit.toLowerCase().trim().replaceAll(" ", "_"))}*";
  }

  static String _translateAction(String s){
      String hit = s.replaceAll("{@action ", "").replaceAll("}", "");
      return S.current.actions(hit.toLowerCase().trim().replaceAll(" ", "_"));
  }

  static String _translated20(String s){
      return s.replaceAll("{@d20 ", "+").replaceAll("}", "");
  }

  static String _translateSpell(String s){
      String hit = s.replaceAll("{@spell ", "").replaceAll("}", "");
      List<Spell> spells = BoxHandler.spellBox.values.where((Spell s)=>s.name["en"]!.toLowerCase().trim()==hit.toLowerCase().trim()).toList();
      return "*${spells.isEmpty ? hit : spells[0].getName()}*";
  }

  static String _translateHit(String s){
      return s.replaceAll("{@hit ", "").replaceAll("}", "");
  }

  static String _translateCreature(String s){
      if(s.contains("huge")) {
        return S.current.huge;
      }
      else if(s.contains("tiny")){
        return S.current.tiny;
      }
      else if(s.contains("small")){
        return S.current.small;
      }
      else if(s.contains("medium")){
        return S.current.medium;
      }
      else if(s.contains("large")){
        return S.current.large;
      }
      else{
        String creature = s.replaceAll("{@creature ", "").replaceAll("}", "");
        if(creature.contains("|")){
          creature = creature.substring(creature.lastIndexOf("|")+1);
        }
        return "*$creature*";
      }
  }

  static String _translateCondition(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@condition [a-zA-Z| ]*}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String condition = match.replaceAll("{@condition ", "").replaceAll("}", "");
      if(condition.contains("|")){
        return condition.substring(condition.lastIndexOf("|")+1);
      }
      return S.current.condition(condition);
    }
    return ret;
  }

  static String _translateDamage(String s){
      List<String> dieString = s.replaceAll("{@dice ", "").replaceAll("{@damage ", "").replaceAll("}", "").split("d");
      int? amount;
      if(dieString[0].isNotEmpty){
        amount = int.parse(dieString[0]);
      }
      int type = 0;
      String add = "";
      String before = "";
      String after = "";
      if(dieString[1].contains("|")){
        List<String> split = dieString[1].split("|");
        dieString[1] = split[0];
        after = ")";
        before = "${split[1]} (";
      }
      if(dieString[1].contains("+")){
        List<String> split = dieString[1].split("+");
        type = int.parse(split[0].trim());
        add = " + ${split[1].trim()}";
      }
      else {
        if(dieString[1].contains("-")){
          List<String> split = dieString[1].split("-");
          type = int.parse(split[0].trim());
          add = " - ${split[1].trim()}";
        }
        else if(dieString[1].contains("×")){
          List<String> split = dieString[1].split("×");
          type = int.parse(split[0].trim());
          add = " × ${split[1].trim()}";
        }
        else {
          type = int.parse(dieString[1]);
        }
      }
      return "*$before${_translateDiceHelper(amount, type)}$add$after*";
  }

  static String _translateDiceHelper(int? amount, int type){
    if(amount == null){
      return S.current.spellDetailDie(type);
    }
    return S.current.spellDetailDice(amount, type);
  }
}