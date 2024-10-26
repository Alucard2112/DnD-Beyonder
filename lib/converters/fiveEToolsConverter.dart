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
    if(ret.contains("{@dice")||ret.contains("{@damage")){
      ret = _translateDamage(ret);
    }
    if(ret.contains("{@condition")){
      ret = _translateCondition(ret);
    }
    if(ret.contains("{@creature")){
      ret = _translateCreature(ret);
    }
    if(ret.contains("{@hit")){
      ret = _translateHit(ret);
    }
    if(ret.contains("{@spell")){
      ret = _translateSpell(ret);
    }
    if(ret.contains("{@sense")){
      ret = _translateSenses(ret);
    }
    if(ret.contains("{@d20")){
      ret = _translated20(ret);
    }
    if(ret.contains("{@action")){
      ret = _translateAction(ret);
    }
    if(ret.contains("{@skill")){
      ret = _translateSkills(ret);
    }
    if(ret.contains("{@race")){
      ret = _translateSpecies(ret);
    }
    if(ret.contains("{@status")){
      ret = _translateStatus(ret);
    }
    if(ret.contains("{@quickref")){
      ret = _translateQuickref(ret);
    }
    if(ret.contains("{@item")){
      ret = _translateItems(ret);
    }
    if(ret.contains("{@scale")){
      ret = _translateScaledamage(ret);
    }
    if(ret.contains("@filter")){
      ret = _translateFilter(ret);
    }
    if(ret.contains("{@note")){
      ret = _translateNote(ret);
    }
    if(ret.contains("{@")){
      ret = _translateGeneric(ret);
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
    String ret = s;
    RegExp exp = RegExp(r'{@filter [0-9a-zA-Z| \[\];&]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.substring(match.indexOf(" ")+1).replaceAll("}", "");
      if(hit.contains("|")){
        hit = hit.substring(0,hit.indexOf("|"));
      }
      ret = ret.replaceAll(match, "*$hit*");
    }
    return ret;
  }

  static String _translateScaledamage(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@scale[a-zA-Z]+ [0-9a-zA-Z| ]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("}", "");
      String dieString = hit.substring(hit.lastIndexOf("|"));
      List<String> split = dieString.split("d");
      int type = int.parse(split[1].trim());
      int amount = int.parse(split[0].trim());
      ret = ret.replaceAll(match, _translateDiceHelper(amount, type));
    }
    return ret;
  }

  static String _translateGeneric(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@[0-9a-zA-Z| ]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.substring(match.indexOf(" ")+1).replaceAll("}", "");
      if(hit.contains("|")){
        hit = hit.substring(hit.lastIndexOf("|"));
      }
      ret = ret.replaceAll(match, hit.substring(0, hit.indexOf("|")));
    }
    return ret;
  }

  static String _translateItems(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@item [0-9a-zA-Z| ]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("{@item ", "").replaceAll("}", "");
      ret = ret.replaceAll(match, "*${hit.substring(hit.lastIndexOf("|"))}*");
    }
    return ret;
  }

  static String _translateQuickref(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@quickref [0-9a-zA-Z| ]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("{@quickref ", "").replaceAll("}", "");
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
      ret = ret.replaceAll(match, replace);
    }
    return ret;
  }

  static String _translateStatus(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@status [a-zA-Z|]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("{@status ", "").replaceAll("}", "");
      if(hit.contains("|")){
        hit = hit.substring(0, hit.indexOf("|"));
      }
      ret = ret.replaceAll(match, "*${S.current.status(hit.toLowerCase().trim().replaceAll(RegExp(r"\W"), "_"))}*");
    }
    return ret;
  }

  static String _translateSpecies(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@race [a-zA-Z]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("{@race ", "").replaceAll("}", "");
      ret = ret.replaceAll(match, "*${S.current.species(hit.toLowerCase().trim().replaceAll(RegExp(r"\W"), "_"))}*");
    }
    return ret;
  }

  static String _translateSkills(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@skill [a-zA-Z]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("{@skill ", "").replaceAll("}", "");
      ret = ret.replaceAll(match, "*${S.current.skills(hit.toLowerCase().trim().replaceAll(" ", "_"))}*");
    }
    return ret;
  }

  static String _translateSenses(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@sense [a-zA-Z]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("{@sense ", "").replaceAll("}", "");
      ret = ret.replaceAll(match, "*${S.current.senses(hit.toLowerCase().trim().replaceAll(" ", "_"))}*");
    }
    return ret;
  }

  static String _translateAction(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@action [a-zA-Z ]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("{@action ", "").replaceAll("}", "");
      ret = ret.replaceAll(match, S.current.actions(hit.toLowerCase().trim().replaceAll(" ", "_")));
    }
    return ret;
  }

  static String _translated20(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@d20 [0-9]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("{@d20 ", "+").replaceAll("}", "");
      ret = ret.replaceAll(match, hit);
    }
    return ret;
  }

  static String _translateSpell(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@spell [0-9a-zA-Z ]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("{@spell ", "").replaceAll("}", "");
      List<Spell> spells = BoxHandler.spellBox.values.where((Spell s)=>s.name["en"]!.toLowerCase().trim()==hit.toLowerCase().trim()).toList();
      ret = ret.replaceAll(match, "*${spells.isEmpty ? hit : spells[0].getName()}*");
    }
    return ret;
  }

  static String _translateHit(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@hit \+[0-9]+}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String hit = match.replaceAll("{@hit ", "").replaceAll("}", "");
      ret = ret.replaceAll(match, hit);
    }
    return ret;
  }

  static String _translateCreature(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@creature [a-zA-Z |()]*}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      if(match.contains("huge")) {
        ret = ret.replaceAll(match, S.current.huge);
      }
      else if(match.contains("tiny")){
        ret = ret.replaceAll(match, S.current.tiny);
      }
      else if(match.contains("small")){
        ret = ret.replaceAll(match, S.current.small);
      }
      else if(match.contains("medium")){
        ret = ret.replaceAll(match, S.current.medium);
      }
      else if(match.contains("large")){
        ret = ret.replaceAll(match, S.current.large);
      }
      else{
        String creature = match.replaceAll("{@creature ", "").replaceAll("}", "");
        if(creature.contains("|")){
          creature = creature.substring(creature.lastIndexOf("|")+1);
        }
        ret = ret.replaceAll(match, "*$creature*");
      }
    }
    return ret;
  }

  static String _translateCondition(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@condition [a-zA-Z| ]*}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String condition = match.replaceAll("{@condition ", "").replaceAll("}", "");
      if(condition.contains("|")){
        condition = condition.substring(0,condition.indexOf("|"));
      }
      ret = ret.replaceAll(match, S.current.condition(condition));
    }
    return ret;
  }

  static String _translateDamage(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@dice [0-9]*d[0-9]+( [+\-×] [0-9]+)?(\|[0-9]+)?}|{@damage [0-9]*d[0-9]+( [+\-×] [0-9]+)?(\|[0-9]+)?}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      List<String> dieString = match.replaceAll("{@dice ", "").replaceAll("{@damage ", "").replaceAll("}", "").split("d");
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
      ret = ret.replaceAll(match, "*$before${_translateDiceHelper(amount, type)}$add$after*");
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