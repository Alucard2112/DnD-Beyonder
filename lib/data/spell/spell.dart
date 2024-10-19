import 'dart:convert';

import 'package:dnd_beyonder/converters/fiveEToolsConverter.dart';
import 'package:dnd_beyonder/data/sortable.dart';
import 'package:dnd_beyonder/data/spell/componentUsedUp.dart';
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

import '../../permanentData/settings.dart';
import '../dnd/dnd_class.dart';
import 'durationType.dart';

part 'spell.g.dart';


@HiveType(typeId: 1)
class Spell extends HiveObject with Sortable<Spell>{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final Map<String, String> name;
  @HiveField(2)
  final SourceBook source;
  @HiveField(3)
  final Map<String, int> page;
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
  final Map<String, List<String>> entries;
  @HiveField(11)
  final Map<String, List<EntryHigherLevel>> entriesHigherLevel;
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
    'entriesHigherLevel' : entriesHigherLevel,
    'conditionInflict' : conditionInflict,
    'savingThrow' : savingThrow,
    'mainClasses' : mainClasses.map((DnDClass c) => c.index).toList(),
    'subclasses' : subClasses.map((SubClasses s) => s.toJson()).toList(),
    'duration' : duration.toJson(),
    'damageInflict' : damageInflict.map((SpellDamageType s) => s.index).toList(),
  };

  Spell.fromJson(Map<String, dynamic> json)
    : id = json["id"] as int,
      name = json["name"],
      source = SourceBook.values[json["source"] as int],
      page = json["page"],
      level = json["level"] as int,
      school = SpellSchool.values[json["school"] as int],
      entries = json["entries"],
      range = Range.fromJson(json["range"]),
      components = Components.fromJson(json["components"]),
      time = Time.fromJson(json["time"]),
      entriesHigherLevel = {},
      conditionInflict = List<String>.from(json["conditionInflict"]),
      savingThrow = List<String>.from(json["savingThrow"]),
      mainClasses = List<int>.from(json["mainClasses"]).map((int i) => DnDClass.values[i]).toSet(),
      subClasses = Set<SubClasses>.from(List<Map<String,dynamic>>.from(json["subclasses"]).map((Map<String,dynamic> m)=>SubClasses.fromJson(m)).toList()),
      duration = Duration.fromJson(json["duration"]),
      damageInflict = List<SpellDamageType>.from(List<int>.from(json["damageInflict"]).map((int i) => SpellDamageType.values[i]).toList()){
      for(MapEntry entry in json["entriesHigherLevel"]){
        List<EntryHigherLevel> values = [];
        for(Map<String, dynamic> m in entry.value){
          values.add(EntryHigherLevel.fromJson(m));
        }
        entriesHigherLevel[entry.key] = values;
      }
  }
  

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

  @override
  int sortName(Spell b) {
    return getName().compareTo(b.getName());
  }

  @override
  int sortLevel(Spell b) {
    return level.compareTo(b.level);
  }

  @override
  int sortDnDClass(Spell b) {
    return mainClasses.elementAt(0).name.compareTo(b.mainClasses.elementAt(0).name);
  }

  @override
  int sortAttackType(Spell b){
    if(damageInflict.isNotEmpty && b.damageInflict.isNotEmpty) {
      return
        spellDamageTypeToName(damageInflict[0]).compareTo(
            spellDamageTypeToName(b.damageInflict[0]));
    }
    return (b.damageInflict.isNotEmpty ? 1 : -1);
  }

  @override
  int sortSchool(Spell b) {
    return spellSchoolToString(school).compareTo(spellSchoolToString(b.school));
  }

  @override
  int sortSource(Spell b) {
    return sourceBookToString(source).compareTo(sourceBookToString(b.source));

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

  String getName(){
    if(name.containsKey(Settings.locale!.languageCode)){
      return name[Settings.locale!.languageCode]!;
    }
    return name["en"]!;
  }

  int getPage(){
    if(page.containsKey(Settings.locale!.languageCode)){
      return page[Settings.locale!.languageCode]!;
    }
    return page["en"]!;
  }

  List<EntryHigherLevel> getEntriesHigherLevel(){
    if(entriesHigherLevel.containsKey(Settings.locale!.languageCode)){
      return entriesHigherLevel[Settings.locale!.languageCode]!;
    }
    return entriesHigherLevel["en"]!;
  }

  List<String> getEntries(){
    if(entries.containsKey(Settings.locale!.languageCode)){
      return entries[Settings.locale!.languageCode]!;
    }
    return entries["en"]!;
  }

  factory Spell.from5eJsonString(String s){
    final json = jsonDecode(s) as Map<String, dynamic>;
    return Spell.from5eJsonObject(json);
  }

  factory Spell.from5eJsonObject(Map<String, dynamic> json){
    SpellSchool schoolJson = getSpellSchoolFromJson(json["school"]);
    Map<String, List<EntryHigherLevel>> higherLevelMap = {};
    List<EntryHigherLevel> entriesAtHigherLevel = [];
    if (json.containsKey("entriesHigherLevel")) {
      for (Map<String, dynamic> map in json["entriesHigherLevel"]) {
        List<String> entries = [];
        for (String s in map["entries"]) {
          entries.add(FiveEToolsConverter.jsonToMD(s));
        }
        entriesAtHigherLevel.add(
            EntryHigherLevel(map["type"], map["name"], entries));
      }
    }
    List<EntryHigherLevel> entriesAtHigherLevelDE = [];
    if (json.containsKey("entriesHigherLevel_de")) {
      for (Map<String, dynamic> map in json["entriesHigherLevel_de"]) {
        List<String> entries = [];
        for (String s in map["entries"]) {
          entries.add(FiveEToolsConverter.jsonToMD(s));
        }
        entriesAtHigherLevel.add(
            EntryHigherLevel(map["type"], map["name"], entries));
      }
    }
    higherLevelMap["en"] = entriesAtHigherLevel;
    higherLevelMap["de"] = entriesAtHigherLevelDE;
    Set<DnDClass> convertedClasses = {};
    for (Map<String, dynamic> map in json["classes"]["fromClassList"]) {
      DnDClass fromJson = fromDnDClassName(map["name"]);
      convertedClasses.add(fromJson);
    }
    Set<SubClasses> subClasses = {};
    if (json["classes"].containsKey("fromSubclass")) {
      for (Map<String, dynamic> map in json["classes"]["fromSubclass"]) {
        Map<String, String> subclassName = {};
        subclassName["en"] = map["subclass"]["name"];
        if(map["subclass"].containsKey("name_de")){
          subclassName["de"] = map["subclass"]["name_de"];
        }
        subClasses.add(
            SubClasses(map["class"]["name"], subclassName)
        );
      }
    }
    List<String> entries = [];
    for (dynamic s in json["entries"] as List<dynamic>) {
      entries.add(FiveEToolsConverter.jsonToMD(s));
    }
    Map<String, List<String>> entriesMap = {};
    entriesMap["en"] = entries;
    if (json.containsKey("entries_de")){
      List<String> entriesDE = [];
      for (dynamic s in json["entries_de"] as List<dynamic>) {
        entriesDE.add(FiveEToolsConverter.jsonToMD(s));
      }
      entriesMap["de"] = entriesDE;
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
    Map<String, String> materialMap = {};
    final material = json["components"]["m"] ?? "";
    ComponentUsedUp usedUp = componentUsedUpFromDynamic(material);
    if(material is Map<String, dynamic>){
      materialMap["en"] = material["text"];
      materialMap["de"] = material["text_de"] ?? material["text"];
    }
    else{
      String mDE = json["components"]["m_de"] ?? "";
      materialMap["de"] = mDE;
      materialMap["en"] = material;
    }
    Components components = Components(json["components"]["v"] ?? false,json["components"]["s"] ?? false, materialMap, usedUp);

    Map<String, dynamic> durationJson = json["duration"][0];
    DurationType type = durationTypeFromString(durationJson["type"]);
    bool concentration = durationJson.containsKey("concentration");
    Duration duration = Duration(type, TimeUnits.unknown, 0, concentration);
    if(type != DurationType.instantaneous){
      duration = Duration(type,timeUnitFromString(durationJson["duration"]["type"]),durationJson["duration"]["amount"], concentration);
    }
    int range = -1;
    if(json["range"]["distance"]?.containsKey("amount") ?? false){
      range = json["range"]["distance"]["amount"];
    }

    List<SpellDamageType> damageType = [];
    if(json.containsKey("damageInflict")) {
      for (String type in json["damageInflict"]) {
        SpellDamageType value = convertFromString(type);
        damageType.add(value);
      }
    }
    int page = json["page"] ?? -1;
    int pageDE = json["page_de"] ?? -1;
    Map<String, int> pageMap = {};
    pageMap["en"] = page;
    pageMap["de"] = pageDE;
    Map<String, String> nameMap = {};
    nameMap["en"] = json["name"];
    if(json.containsKey("name_de")){
      nameMap["de"] = json["name_de"];
    }
    return Spell(
        "${json["name"]}_${json["source"]}".hashCode,
        nameMap,
        sourceBookFromShortString(json["source"]),
        pageMap,
        json["level"],
        schoolJson,
        entriesMap,
        Range(json["range"]["type"],range,distanceTypeFromString(json["range"]["distance"]?["type"] ?? "special")),
        components,
        Time(json["time"][0]["number"],timeUnitFromString(json["time"][0]["unit"])),
        higherLevelMap,
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