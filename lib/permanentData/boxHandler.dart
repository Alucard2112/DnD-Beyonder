import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/spell/componentUsedUp.dart';
import 'package:dnd_beyonder/data/spell/components.dart';
import 'package:dnd_beyonder/data/spell/damageType.dart';
import 'package:dnd_beyonder/data/spell/distanceType.dart';
import 'package:dnd_beyonder/data/spell/duration.dart';
import 'package:dnd_beyonder/data/spell/durationType.dart';
import 'package:dnd_beyonder/data/spell/entryHigherLevel.dart';
import 'package:dnd_beyonder/data/spell/range.dart';
import 'package:dnd_beyonder/data/spell/sourceBook.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/data/spell/spellSchool.dart';
import 'package:dnd_beyonder/data/spell/subclass.dart';
import 'package:dnd_beyonder/data/spell/time.dart';
import 'package:dnd_beyonder/data/spell/timeUnits.dart';
import 'package:dnd_beyonder/data/character/character.dart';
import 'package:hive_flutter/hive_flutter.dart';

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