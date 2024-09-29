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
import 'package:dnd_beyonder/database/dbhandler.dart';

import '../dnd/dnd_class.dart';
import 'durationType.dart';

class Spell{
  final int id;
  final String name;
  final SourceBook source;
  final int page;
  final int level;
  final SpellSchool school;
  final Range range;
  final Duration duration;
  final Components components;
  final Time time;
  final List<String> entries;
  final List<EntryHigherLevel> entriesHigherLevel;
  final List<String> conditionInflict;
  final List<String> savingThrow;
  final Set<DnDClass> mainClasses;
  final Set<SubClasses> subClasses;
  final List<SpellDamageType> damageInflict;

  Spell(this.id,this.name, this.source, this.page, this.level, this.school, this.entries,
      this.range, this.components, this.time, this.entriesHigherLevel,
      this.conditionInflict, this.savingThrow, this.mainClasses, this.subClasses, this.duration, this.damageInflict);

  static String getLevelString(int level){
    if(level > 0) {
      return "$level. Grad";
    }
    return "Zaubertrick";
  }

  @override
  int get hashCode => name.hashCode + source.hashCode;

  String getSchoolLevelForUI(){
    if(level > 0) {
      return "${spellSchoolToString(school)} des ${getLevelString(level)}es";
    }
    return "${getLevelString(level)} der ${spellSchoolToString(school)}";
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
          entries.add(s);
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
      entries.add(s.toString());
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
        DatabaseHandler.getNewId(),
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