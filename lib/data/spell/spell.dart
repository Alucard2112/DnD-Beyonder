import 'dart:convert';

import 'package:dnd_beyonder/data/spell/components.dart';
import 'package:dnd_beyonder/data/spell/damageType.dart';
import 'package:dnd_beyonder/data/spell/distanceType.dart';
import 'package:dnd_beyonder/data/spell/entryHigherLevel.dart';
import 'package:dnd_beyonder/data/spell/range.dart';
import 'package:dnd_beyonder/data/spell/sourceBook.dart';
import 'package:dnd_beyonder/data/spell/spellSchool.dart';
import 'package:dnd_beyonder/data/spell/subclass.dart';
import 'package:dnd_beyonder/data/spell/time.dart';
import 'package:dnd_beyonder/data/spell/duration.dart';
import 'package:dnd_beyonder/data/spell/timeUnits.dart';
import 'package:dnd_beyonder/generated/l10n.dart';
import 'package:hive/hive.dart';

import '../dnd/dnd_class.dart';
import 'durationType.dart';

part 'spell.g.dart';


@HiveType(typeId: 1)
class Spell extends HiveObject{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final SourceBook source;
  @HiveField(3)
  final int page;
  @HiveField(4)
  final int level;
  @HiveField(5)
  final SpellSchool school;
  @HiveField(6)
  final Range range;
  @HiveField(7)
  final Duration duration;
  @HiveField(8)
  final Components components;
  @HiveField(9)
  final Time time;
  @HiveField(10)
  final List<String> entries;
  @HiveField(11)
  final List<EntryHigherLevel> entriesHigherLevel;
  @HiveField(12)
  final List<String> conditionInflict;
  @HiveField(13)
  final List<String> savingThrow;
  @HiveField(14)
  final Set<DnDClass> mainClasses;
  @HiveField(15)
  final Set<SubClasses> subClasses;
  @HiveField(16)
  final List<SpellDamageType> damageInflict;

  Spell(this.id,this.name, this.source, this.page, this.level, this.school, this.entries,
      this.range, this.components, this.time, this.entriesHigherLevel,
      this.conditionInflict, this.savingThrow, this.mainClasses, this.subClasses, this.duration, this.damageInflict);

  static String getLevelString(int level){
    switch(level){
      case 0:
        return S.current.spellLevelZero;
      case 1:
        return S.current.spellLevelOne;
      case 2:
        return S.current.spellLevelTwo;
      case 3:
        return S.current.spellLevelThree;
    }
    return S.current.spellLevel(level);
  }

  @override
  int get hashCode => id;

  static String _5eToMD(dynamic s){
    if(s is Map<String, dynamic>){
      switch(s["type"]){
        case "entries":
          String entry = "**${s["name"]}**.";
          for(dynamic st in s["entries"]){
            entry+=_5eToMD(st);
          }
          return entry;
        case "list":
          String list = "";
          for(dynamic item in s["items"]){
            list+="- ${_5eToMD(item)}\n";
          }
          return list;
        case "table":
          String table = ("# ${s["caption"]}");
          return table;
        default:
          return "";

      }
    }
    else {
      return s.toString();
    }
  }

  String getSchoolLevelForUI(){
    switch(level){
      case 0:
        return S.current.spellSchoolLevelZero(getSchoolString());
      case 1:
        return S.current.spellSchoolLevelOne(getSchoolString());
      case 2:
        return S.current.spellSchoolLevelTwo(getSchoolString());
      case 3:
        return S.current.spellSchoolLevelThree(getSchoolString());
    }
    return S.current.spellSchoolLevel(level, getSchoolString());
  }

  String getSchoolString(){
    return spellSchoolToString(school);
  }

  factory Spell.fromJsonString(String s){
    final json = jsonDecode(s) as Map<String, dynamic>;
    return Spell.fromJsonObject(json);
  }

  factory Spell.fromJsonObject(Map<String, dynamic> json){
    SpellSchool schoolJson = getSpellSchoolFromJson(json["school"]);
    List<EntryHigherLevel> entriesAtHigherLevel = [];
    if(json.containsKey("entriesHigherLevel")) {
      for (Map<String, dynamic> map in json["entriesHigherLevel"]) {
        List<String> entries = [];
        for (String s in map["entries"]) {
          entries.add(_5eToMD(s));
        }
        entriesAtHigherLevel.add(
            EntryHigherLevel(map["type"], map["name"], entries));
      }
    }
    Set<DnDClass> convertedClasses = {};
    for(Map<String, dynamic> map in json["classes"]["fromClassList"]){
      DnDClass fromJson = fromDnDClassName(map["name"]);
      convertedClasses.add(fromJson);
    }
    Set<SubClasses> subClasses = {};
    if(json["classes"].containsKey("fromSubclass")) {
      for (Map<String, dynamic> map in json["classes"]["fromSubclass"]) {
        subClasses.add(
          SubClasses(map["class"]["name"], map["subclass"]["name"])
        );
      }
    }
    List<String> entries = [];
    for(dynamic s in json["entries"] as List<dynamic>){
      entries.add(_5eToMD(s));
    }
    List<String> conditionInflict = [];
    if(json.containsKey("conditionInflict")) {
      for (String s in json["conditionInflict"]) {
        conditionInflict.add(s);
      }
    }
    List<String> savingThrow = [];
    if(json.containsKey("savingThrow")) {
      for (String s in json["savingThrow"]) {
        savingThrow.add(s);
      }
    }
    String m = json["components"].containsKey("m") ? json["components"]["m"] : "";
    Components components = Components(json["components"]["v"],json["components"]["s"], m);

    DurationType type = durationTypeFromString(json["duration"][0]["type"]);
    Duration duration = Duration(type, TimeUnits.unknown, 0);
    if(type != DurationType.instantaneous){
      duration = Duration(type,timeUnitFromString(json["duration"][0]["duration"]["type"]),json["duration"][0]["duration"]["amount"]);
    }
    int range = -1;
    if(json["range"]["distance"].containsKey("amount")){
      range = json["range"]["distance"]["amount"];
    }

    List<SpellDamageType> damageType = [];
    if(json.containsKey("damageInflict")) {
      for (String type in json["damageInflict"]) {
        SpellDamageType value = convertFromString(type);
        damageType.add(value);
      }
    }
    int page = -1;
    if(json.containsKey("page")){
      page = json["page"];
    }
    return Spell(
        "${json["name"]}_${json["source"]}".hashCode,
        json["name"],
        sourceBookFromShortString(json["source"]),
        page,
        json["level"],
        schoolJson,
        entries,
        Range(json["range"]["type"],range,distanceTypeFromString(json["range"]["distance"]["type"])),
        components,
        Time(json["time"][0]["number"],timeUnitFromString(json["time"][0]["unit"])),
        entriesAtHigherLevel,
        conditionInflict,
        savingThrow,
        convertedClasses,
        subClasses,
        duration,
    damageType);
  }

  static List<Spell> spellListFromJson(String s){
    List<Spell> spells = [];
    final json = jsonDecode(s) as Map<String, dynamic>;
    for(Map<String, dynamic> map in json["spell"]){
      spells.add(Spell.fromJsonObject(map));
    }
    return spells;
  }
}