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
      ret = _translateHit(ret);
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
      List<Spell> spells = BoxHandler.spellBox.values.where((Spell s)=>s.getName().toLowerCase().trim()==hit.toLowerCase().trim()).toList();
      ret = ret.replaceAll(match, spells.isEmpty ? hit : spells[0].getName());
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
      String size = S.current.huge;
      if(match.contains("tiny")){
        size = S.current.tiny;
      }
      if(match.contains("small")){
        size = S.current.small;
      }
      if(match.contains("medium")){
        size = S.current.medium;
      }
      if(match.contains("large")){
        size = S.current.large;
      }
      ret = ret.replaceAll(match, size);
    }
    return ret;
  }

  static String _translateCondition(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@condition [a-zA-Z ]*}');
    Iterable<Match> matches = exp.allMatches(s);
    for (final Match m in matches) {
      String match = m[0]!;
      String condition = match.replaceAll("{@condition ", "").replaceAll("}", "");
      ret = ret.replaceAll(match, S.current.condition(condition));
    }
    return ret;
  }

  static String _translateDamage(String s){
    String ret = s;
    RegExp exp = RegExp(r'{@dice [0-9]*d[0-9]+( [\+\-] [0-9]+)?(\|[0-9]+)?}|{@damage [0-9]*d[0-9]+( [\+\-] [0-9]+)?(\|[0-9]+)?}');
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
        else {
          type = int.parse(dieString[1]);
        }
      }
      ret = ret.replaceAll(match, "$before${_translateDiceHelper(amount, type)}$add$after");
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