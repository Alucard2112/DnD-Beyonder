import 'package:tavern_tome/data/dnd/dnd_class.dart';
import 'package:tavern_tome/data/spell/componentUsedUp.dart';
import 'package:tavern_tome/data/spell/components.dart';
import 'package:tavern_tome/data/spell/damageType.dart';
import 'package:tavern_tome/data/spell/distanceType.dart';
import 'package:tavern_tome/data/spell/duration.dart';
import 'package:tavern_tome/data/spell/durationType.dart';
import 'package:tavern_tome/data/spell/entryHigherLevel.dart';
import 'package:tavern_tome/data/spell/range.dart';
import 'package:tavern_tome/data/spell/sourceBook.dart';
import 'package:tavern_tome/data/spell/spell.dart';
import 'package:tavern_tome/data/spell/spellSchool.dart';
import 'package:tavern_tome/data/spell/subclass.dart';
import 'package:tavern_tome/data/spell/time.dart';
import 'package:tavern_tome/data/spell/timeUnits.dart';
import 'package:tavern_tome/data/character/character.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/spell/durationEndType.dart';

class BoxHandler{
  static late final Box<Spell> spellBox;
  static late final Box<Character> characterBox;

  static const String _spellBox = "spells";
  static const String _characterBox = "characters";

  static Future<void> initialise() async{
    await Hive.initFlutter();
    Hive.registerAdapter(SpellAdapter());
    Hive.registerAdapter(SpellDamageTypeAdapter());
    Hive.registerAdapter(ComponentsAdapter());
    Hive.registerAdapter(ComponentUsedUpAdapter());
    Hive.registerAdapter(DistanceTypeAdapter());
    Hive.registerAdapter(DnDClassAdapter());
    Hive.registerAdapter(DurationEndTypeAdapter());
    Hive.registerAdapter(DurationTypeAdapter());
    Hive.registerAdapter(DurationAdapter());
    Hive.registerAdapter(EntryHigherLevelAdapter());
    Hive.registerAdapter(RangeAdapter());
    Hive.registerAdapter(SourceBookAdapter());
    Hive.registerAdapter(SpellSchoolAdapter());
    Hive.registerAdapter(SubClassesAdapter());
    Hive.registerAdapter(TimeAdapter());
    Hive.registerAdapter(TimeUnitsAdapter());
    Hive.registerAdapter(CharacterAdapter());
    spellBox = await Hive.openBox<Spell>(_spellBox);
    characterBox = await Hive.openBox<Character>(_characterBox);
  }

  static void delete(){
    spellBox.deleteAll(spellBox.keys);
    characterBox.deleteAll(characterBox.keys);
  }

}