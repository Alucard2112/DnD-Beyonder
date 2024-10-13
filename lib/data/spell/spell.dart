import 'dart:convert';

import 'package:dnd_beyonder/converters/fiveEToolsConverter.dart';
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

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'source' : source.index,
    'page' : page,
    'level' : level,
    'school' : school.index,
    'entries' : entries,
    'range' : range.toJson(),
    'components' : components.toJson(),
    'time' : time.toJson(),
    'entriesHigherLevel' : entriesHigherLevel.map((EntryHigherLevel e) => e.toJson()).toList(),
    'conditionInflict' : conditionInflict,
    'savingThrow' : savingThrow,
    'mainClasses' : mainClasses.map((DnDClass c) => c.index).toList(),
    'subclasses' : subClasses.map((SubClasses s) => s.toJson()).toList(),
    'duration' : duration.toJson(),
    'damageInflict' : damageInflict.map((SpellDamageType s) => s.index).toList(),
  };

  Spell.fromJson(Map<String, dynamic> json)
    : id = json["id"] as int,
      name = json["name"] as String,
      source = SourceBook.values[json["source"] as int],
      page = json["page"] as int,
      level = json["level"] as int,
      school = SpellSchool.values[json["school"] as int],
      entries = List<String>.from(json["entries"]),
      range = Range.fromJson(json["range"]),
      components = Components.fromJson(json["components"]),
      time = Time.fromJson(json["time"]),
      entriesHigherLevel = List<EntryHigherLevel>.from(List<Map<String, dynamic>>.from(json["entriesHigherLevel"]).map((Map<String,dynamic> m)=>EntryHigherLevel.fromJson(m)).toList()),
      conditionInflict = List<String>.from(json["conditionInflict"]),
      savingThrow = List<String>.from(json["savingThrow"]),
      mainClasses = List<int>.from(json["mainClasses"]).map((int i) => DnDClass.values[i]).toSet(),
      subClasses = Set<SubClasses>.from(List<Map<String,dynamic>>.from(json["subclasses"]).map((Map<String,dynamic> m)=>SubClasses.fromJson(m)).toList()),
      duration = Duration.fromJson(json["duration"]),
      damageInflict = List<SpellDamageType>.from(List<int>.from(json["damageInflict"]).map((int i) => SpellDamageType.values[i]).toList());
  

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

  factory Spell.from5eJsonString(String s){
    final json = jsonDecode(s) as Map<String, dynamic>;
    return Spell.from5eJsonObject(json);
  }

  factory Spell.from5eJsonObject(Map<String, dynamic> json){
    SpellSchool schoolJson = getSpellSchoolFromJson(json["school"]);
    List<EntryHigherLevel> entriesAtHigherLevel = [];
    if(json.containsKey("entriesHigherLevel")) {
      for (Map<String, dynamic> map in json["entriesHigherLevel"]) {
        List<String> entries = [];
        for (String s in map["entries"]) {
          entries.add(FiveEToolsConverter.jsonToMD(s));
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
      entries.add(FiveEToolsConverter.jsonToMD(s));
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

    Map<String, dynamic> durationJson = json["duration"][0];
    DurationType type = durationTypeFromString(durationJson["type"]);
    bool concentration = durationJson.containsKey("concentration");
    Duration duration = Duration(type, TimeUnits.unknown, 0, concentration);
    if(type != DurationType.instantaneous){
      duration = Duration(type,timeUnitFromString(durationJson["duration"]["type"]),durationJson["duration"]["amount"], concentration);
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

  static List<Spell> spellListFrom5eJson(String s){
    List<Spell> spells = [];
    final json = jsonDecode(s) as Map<String, dynamic>;
    for(Map<String, dynamic> map in json["spell"]){
      spells.add(Spell.from5eJsonObject(map));
    }
    return spells;
  }
}