// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, one: '1 Action', other: '${count} Actions')}";

  static String m1(action) => "${Intl.select(action, {
            'attack': 'Attack',
            'dash': 'Dash',
            'disengage': 'Disengage',
            'hide': 'Hide',
            'use_an_object': 'Use an Object',
            'other': 'Error',
          })}";

  static String m2(count) =>
      "${Intl.plural(count, one: '1 Bonusaction', other: '${count} Bonusactions')}";

  static String m3(name) =>
      "Are you sure that you want to delete the character ***${name}***?\nIt is not possible to revert this decision.";

  static String m4(cond) => "${Intl.select(cond, {
            'blinded': 'Blinded',
            'charmed': 'Charmed',
            'deafened': 'Deafened',
            'frightened': 'Frightened',
            'grappled': 'Grappled',
            'incapacitated': 'Incapacitated',
            'invisible': 'Invisible',
            'paralyzed': 'Paralyzed',
            'petrified': 'Petrified',
            'poisoned': 'Poisoned',
            'prone': 'Prone',
            'restrained': 'Restrained',
            'stunned': 'Stunned',
            'unconscious': 'Unconscious',
            'exhaustion': 'Exhaustion',
            'other': 'Error',
          })}";

  static String m5(cover) => "${Intl.select(cover, {
            'half_cover': 'half cover',
            'three_quarters_cover': 'three-quarters cover',
            'total_cover': 'total cover',
            'other': 'Error',
          })}";

  static String m6(count) => "${count} Feet";

  static String m7(count) =>
      "${Intl.plural(count, one: '1 Hour', other: '${count} Hours')}";

  static String m8(count) =>
      "${Intl.plural(count, one: '1 Kilometer', other: '${count} Kilometers')}";

  static String m9(light) => "${Intl.select(light, {
            'bright_light': 'bright light',
            'dim_light': 'dim light',
            'darkness': 'darkness',
            'other': 'Error',
          })}";

  static String m10(count) =>
      "${Intl.plural(count, one: '1 Meter', other: '${count} Meters')}";

  static String m11(count) =>
      "${Intl.plural(count, one: '1 Mile', other: '${count} Miles')}";

  static String m12(count) =>
      "${Intl.plural(count, one: '1 Minute', other: '${count} Minutes')}";

  static String m13(count) =>
      "${Intl.plural(count, one: '1 Reaction', other: '${count} Reactions')}";

  static String m14(count) =>
      "${Intl.plural(count, one: '1 Second', other: '${count} Seconds')}";

  static String m15(sense) => "${Intl.select(sense, {
            'darkvision': 'Darkvision',
            'truesight': 'Truesight',
            'blindsight': 'Blindsight',
            'other': 'Error',
          })}";

  static String m16(lang) => "${Intl.select(lang, {
            'en': 'English',
            'de': 'German',
            'other': 'Error',
          })}";

  static String m17(skill) => "${Intl.select(skill, {
            'athletics': 'Athletics',
            'acrobatics': 'Acrobatics',
            'sleight_of_hand': 'Sleight of Hand',
            'stealth': 'Stealth',
            'arcana': 'Arcana',
            'history': 'History',
            'investigation': 'Investigation',
            'nature': 'Nature',
            'religion': 'Religion',
            'animal_handling': 'Animal Handling',
            'insight': 'Insight',
            'medicine': 'Medicine',
            'perception': 'Perception',
            'survival': 'Survival',
            'deception': 'Deception',
            'intimidation': 'Intimidation',
            'performance': 'Performance',
            'persuasion': 'Persuasion',
            'other': 'Error',
          })}";

  static String m18(selectSpecies) => "${Intl.select(selectSpecies, {
            'half_elf': 'Halfelf',
            'half_orc': 'Halforc',
            'dragonborn': 'Dragonborn',
            'human': 'Human',
            'tiefling': 'Tiefling',
            'dwarf': 'Dwarf',
            'dwarf_hill': 'Hilldwarf',
            'dwarf_mountain': 'Mountaindwarf',
            'elf': 'Elf',
            'elf_drow': 'Drow',
            'elf_high': 'Highelf',
            'elf_wood': 'Woodelf',
            'halfling': 'Halfling',
            'halfling_stout': 'Stout Halfling',
            'halfling_lightfoot': 'Lightfood Halfling',
            'aasimar': 'Aasimar',
            'gnome': 'Gnome',
            'gnome_forest': 'Forest-Gnome',
            'gnome_rock': 'Rock-Gnome',
            'goliath': 'Goliath',
            'orc': 'Orc',
            'aarakocra': 'Aarakocra',
            'air_genasi': 'Air Genasi',
            'bugbear': 'Bugbear',
            'centaur': 'Centaur',
            'changeling': 'Changeling',
            'deep_gnome': 'Deep Gnome',
            'duergar': 'Duergar',
            'earth_genasi': 'Earth Genasi',
            'eladrin': 'Eladrin',
            'fairy': 'Fairy',
            'firbolg': 'Firbolg',
            'fire_genasi': 'Fire Genasi',
            'githyanki': 'Githyanki',
            'githzerai': 'Githzerai',
            'goblin': 'Goblin',
            'harengon': 'Harengon',
            'hobgoblin': 'Hobgoblin',
            'kenku': 'Kenku',
            'kobold': 'Kobold',
            'lizardfolk': 'Lizardfolk',
            'minotaur': 'Minotaur',
            'satyr': 'Satyr',
            'sea_elf': 'Sea Elf',
            'shadar_kai': 'Shadar-kai',
            'shifter': 'Shifter',
            'tabaxi': 'Tabaxi',
            'tortle': 'Tortle',
            'triton': 'Triton',
            'water_genasi': 'Water Genasi',
            'yuan_ti': 'Yuan-ti',
            'kender': 'Kender',
            'other': 'Error',
          })}";

  static String m19(amount) => "${amount} Spells";

  static String m20(name) =>
      "Are you sure that you want to delete the spell ***${name}***?\nIt is not possible to revert this decision.";

  static String m21(numberDice, typeDie) => "${numberDice}D${typeDie}";

  static String m22(typeDie) => "D${typeDie}";

  static String m23(condition) => "Until the spell is ${condition}";

  static String m24(name, charname) =>
      "Are your sure that you want to remove ***${name}*** from ***${charname}***?";

  static String m25(lvl) =>
      "${Intl.plural(lvl, zero: 'Cantrip', one: '1st Level', two: '2nd Level', few: '3rd Level', other: '${lvl}th Level')}";

  static String m26(lvl, school) =>
      "${Intl.plural(lvl, zero: '${school} Cantrip', one: '1st Level ${school}', two: '2nd Level ${school}', few: '3rd Level ${school}', other: '${lvl}th Level ${school}')}";

  static String m27(status) => "${Intl.select(status, {
            'concentration': 'Concentration',
            'surprised': 'Surprised',
            'other': 'Error',
          })}";

  static String m28(visibility) => "${Intl.select(visibility, {
            'lightly_obscured': 'lightly obscured',
            'heavily_obscured': 'heavily obscured',
            'other': 'Error',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "abjuration": MessageLookupByLibrary.simpleMessage("Abjuration"),
        "acid": MessageLookupByLibrary.simpleMessage("Acid"),
        "action": m0,
        "actions": m1,
        "ai": MessageLookupByLibrary.simpleMessage("Acquisitions Incorporated"),
        "artificer": MessageLookupByLibrary.simpleMessage("Artificer"),
        "ascending": MessageLookupByLibrary.simpleMessage("Ascending"),
        "attackType": MessageLookupByLibrary.simpleMessage("Damage Type"),
        "aventh": MessageLookupByLibrary.simpleMessage("Aventuristic Heroes"),
        "aventm": MessageLookupByLibrary.simpleMessage("Aventuristic Monsters"),
        "barbarian": MessageLookupByLibrary.simpleMessage("Barbarian"),
        "bard": MessageLookupByLibrary.simpleMessage("Bard"),
        "bludgeoning": MessageLookupByLibrary.simpleMessage("Bludgeoning"),
        "bomt": MessageLookupByLibrary.simpleMessage("The Book of Many Things"),
        "bonusAction": m2,
        "characterAddTitle":
            MessageLookupByLibrary.simpleMessage("Add Character"),
        "characterClass":
            MessageLookupByLibrary.simpleMessage("Class of Character"),
        "characterDeleteMessage": m3,
        "characterDeleteOk": MessageLookupByLibrary.simpleMessage("Delete"),
        "characterDeleteTitle":
            MessageLookupByLibrary.simpleMessage("Delete Character"),
        "characterEditTitle":
            MessageLookupByLibrary.simpleMessage("Edit Character"),
        "characterName":
            MessageLookupByLibrary.simpleMessage("Name of Character"),
        "characterNoSpells": MessageLookupByLibrary.simpleMessage(
            "No spells found. Please import spells using the button on the settings page."),
        "cleric": MessageLookupByLibrary.simpleMessage("Cleric"),
        "cold": MessageLookupByLibrary.simpleMessage("Cold"),
        "concentration": MessageLookupByLibrary.simpleMessage("Concentration"),
        "condition": m4,
        "conjuration": MessageLookupByLibrary.simpleMessage("Conjuration"),
        "cover": m5,
        "cthulhu": MessageLookupByLibrary.simpleMessage(
            "Sandy Petersens Cthulhu Mythos"),
        "descending": MessageLookupByLibrary.simpleMessage("Descending"),
        "difficultTerrain":
            MessageLookupByLibrary.simpleMessage("difficult terrain"),
        "dispel": MessageLookupByLibrary.simpleMessage("dispelled"),
        "divination": MessageLookupByLibrary.simpleMessage("Divination"),
        "dndClass": MessageLookupByLibrary.simpleMessage("Class"),
        "dosi":
            MessageLookupByLibrary.simpleMessage("Dragons of Stormwreck Isle"),
        "druid": MessageLookupByLibrary.simpleMessage("Druid"),
        "eepc": MessageLookupByLibrary.simpleMessage(
            "Elemental Evil Player’s Companion"),
        "egtw": MessageLookupByLibrary.simpleMessage(
            "Explorer\'s Guide to Wildemount"),
        "enchantment": MessageLookupByLibrary.simpleMessage("Enchantment"),
        "evocation": MessageLookupByLibrary.simpleMessage("Evocation"),
        "feet": MessageLookupByLibrary.simpleMessage("Feet"),
        "feetForUi": m6,
        "ff2g": MessageLookupByLibrary.simpleMessage("Fateforge: 2. Awakened"),
        "ff3c": MessageLookupByLibrary.simpleMessage("Fateforge: 3. Creatures"),
        "fighter": MessageLookupByLibrary.simpleMessage("Fighter"),
        "filterCastTime": MessageLookupByLibrary.simpleMessage("Casting Time"),
        "filterClasses": MessageLookupByLibrary.simpleMessage("Classes"),
        "filterDamage": MessageLookupByLibrary.simpleMessage("Damage Type"),
        "filterLevel": MessageLookupByLibrary.simpleMessage("Level"),
        "filterReset": MessageLookupByLibrary.simpleMessage("Reset Filter"),
        "filterSchool": MessageLookupByLibrary.simpleMessage("School"),
        "filterSpells": MessageLookupByLibrary.simpleMessage("Filter Spells"),
        "filterUnselect": MessageLookupByLibrary.simpleMessage("Unselect All"),
        "fire": MessageLookupByLibrary.simpleMessage("Fire"),
        "force": MessageLookupByLibrary.simpleMessage("Force"),
        "ftod": MessageLookupByLibrary.simpleMessage(
            "Fizban\'s Treasury of Dragons"),
        "homebrew": MessageLookupByLibrary.simpleMessage("Homebrew"),
        "hour": m7,
        "huge": MessageLookupByLibrary.simpleMessage("huge"),
        "humblewood": MessageLookupByLibrary.simpleMessage("Humblewood"),
        "idrotf": MessageLookupByLibrary.simpleMessage(
            "Icewind Dale: Rim of the Frost Maiden"),
        "illusion": MessageLookupByLibrary.simpleMessage("Illusion"),
        "instantaneous": MessageLookupByLibrary.simpleMessage("Instantaneous"),
        "km": MessageLookupByLibrary.simpleMessage("Kilometer"),
        "kmForUi": m8,
        "large": MessageLookupByLibrary.simpleMessage("large"),
        "level": MessageLookupByLibrary.simpleMessage("Level"),
        "light": m9,
        "lightning": MessageLookupByLibrary.simpleMessage("Lightning"),
        "longbow": MessageLookupByLibrary.simpleMessage("Longbow"),
        "mainScreenSettings": MessageLookupByLibrary.simpleMessage("Settings"),
        "mainScreenSpellBooks":
            MessageLookupByLibrary.simpleMessage("Characters"),
        "mainScreenSpellList":
            MessageLookupByLibrary.simpleMessage("Spell-List"),
        "material": MessageLookupByLibrary.simpleMessage("Material"),
        "medium": MessageLookupByLibrary.simpleMessage("medium"),
        "meleeWeaponAttacks":
            MessageLookupByLibrary.simpleMessage("Melee Weapon Attacks"),
        "meter": MessageLookupByLibrary.simpleMessage("Meter"),
        "meterForUi": m10,
        "mile": MessageLookupByLibrary.simpleMessage("Mile"),
        "mileForUi": m11,
        "minute": m12,
        "monk": MessageLookupByLibrary.simpleMessage("Monk"),
        "mtgafr": MessageLookupByLibrary.simpleMessage(
            "Adventures in the Forgotten Realms"),
        "mythaddm": MessageLookupByLibrary.simpleMessage(
            "Mythgart Adventures of the Dark Master"),
        "mythheld":
            MessageLookupByLibrary.simpleMessage("Mythgart Handbook of Heroes"),
        "mythsaga": MessageLookupByLibrary.simpleMessage("Mythgart Sagas"),
        "mythwelt": MessageLookupByLibrary.simpleMessage("Mythgart Worldbook"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "naturalAttacks":
            MessageLookupByLibrary.simpleMessage("Natural Attacks"),
        "necromancy": MessageLookupByLibrary.simpleMessage("Necromancy"),
        "necrotic": MessageLookupByLibrary.simpleMessage("Necrotic"),
        "onHigherLevels":
            MessageLookupByLibrary.simpleMessage("At Higher Levels"),
        "oneHandedMeleeAttacks":
            MessageLookupByLibrary.simpleMessage("One-handed Melee-Attacks"),
        "or": MessageLookupByLibrary.simpleMessage("or"),
        "paladin": MessageLookupByLibrary.simpleMessage("Paladin"),
        "pamsato": MessageLookupByLibrary.simpleMessage(
            "Planescape Adventures in the Multiverse: Sigil and the Outlands"),
        "phb":
            MessageLookupByLibrary.simpleMessage("Player\'s Handbook (2014)"),
        "piercing": MessageLookupByLibrary.simpleMessage("Piercing"),
        "poison": MessageLookupByLibrary.simpleMessage("Poison"),
        "pota":
            MessageLookupByLibrary.simpleMessage("Princes of the Apocalypse"),
        "psychic": MessageLookupByLibrary.simpleMessage("Psychic"),
        "radiant": MessageLookupByLibrary.simpleMessage("Radiant"),
        "ragnarok": MessageLookupByLibrary.simpleMessage("Journey to Ragnarok"),
        "ranger": MessageLookupByLibrary.simpleMessage("Ranger"),
        "reaction": m13,
        "rogue": MessageLookupByLibrary.simpleMessage("Rogue"),
        "sasaag": MessageLookupByLibrary.simpleMessage(
            "Spelljammer Adventures in Space: Astral Adventurer\'s Guide"),
        "scag": MessageLookupByLibrary.simpleMessage(
            "Sword Coast Adventurer\'s Guide"),
        "scc": MessageLookupByLibrary.simpleMessage(
            "Strixhaven: A Curriculum of Chaos"),
        "school": MessageLookupByLibrary.simpleMessage("Spellschool"),
        "searchSpells": MessageLookupByLibrary.simpleMessage("Search Spells"),
        "second": m14,
        "self": MessageLookupByLibrary.simpleMessage("Self"),
        "senses": m15,
        "settings5eMessage": MessageLookupByLibrary.simpleMessage(
            "This import is only meant for json-Files from 5e-Tools and not for those exported from this app."),
        "settingsAppMessage": MessageLookupByLibrary.simpleMessage(
            "This import is only meant for json-Files generated by this app and not from 5e-Tools.\nThe import may override existing data."),
        "settingsData": MessageLookupByLibrary.simpleMessage("Data Options"),
        "settingsDeleteData":
            MessageLookupByLibrary.simpleMessage("Delete App-Data"),
        "settingsDistanceType":
            MessageLookupByLibrary.simpleMessage("Select Unit"),
        "settingsDoNotShowMessageAgain": MessageLookupByLibrary.simpleMessage(
            "Do not show this message again"),
        "settingsExportData":
            MessageLookupByLibrary.simpleMessage("Export App-Data"),
        "settingsExportMessage":
            MessageLookupByLibrary.simpleMessage("Data exported successfully"),
        "settingsImport5e":
            MessageLookupByLibrary.simpleMessage("Import 5e Spells"),
        "settingsImportData":
            MessageLookupByLibrary.simpleMessage("Import App-Data"),
        "settingsLanguage": MessageLookupByLibrary.simpleMessage("Language"),
        "settingsLanguageDescription": MessageLookupByLibrary.simpleMessage(
            "The selected language only affects the interface"),
        "settingsLanguageLabel":
            MessageLookupByLibrary.simpleMessage("Select Language"),
        "settingsLanguages": m16,
        "shortbow": MessageLookupByLibrary.simpleMessage("Shortbow"),
        "skills": m17,
        "slashing": MessageLookupByLibrary.simpleMessage("Slashing"),
        "small": MessageLookupByLibrary.simpleMessage("small"),
        "somatic": MessageLookupByLibrary.simpleMessage("Somatic"),
        "sorcerer": MessageLookupByLibrary.simpleMessage("Sorcerer"),
        "sortBy": MessageLookupByLibrary.simpleMessage("Sort by"),
        "source": MessageLookupByLibrary.simpleMessage("Source"),
        "special": MessageLookupByLibrary.simpleMessage("Special"),
        "species": m18,
        "spellBookSearchCharacter":
            MessageLookupByLibrary.simpleMessage("Search Character"),
        "spellBookSpellCount": m19,
        "spellCount": MessageLookupByLibrary.simpleMessage("Number of Spells"),
        "spellDetailAddSpellNoChars": MessageLookupByLibrary.simpleMessage(
            "No Character exists. Please create a Character in order to add something to that Character."),
        "spellDetailAddSpellTitle":
            MessageLookupByLibrary.simpleMessage("Add to Character"),
        "spellDetailCastTime":
            MessageLookupByLibrary.simpleMessage("Casting Time"),
        "spellDetailClasses": MessageLookupByLibrary.simpleMessage("Classes"),
        "spellDetailComponents":
            MessageLookupByLibrary.simpleMessage("Components"),
        "spellDetailDeleteMessage": m20,
        "spellDetailDeleteTitle":
            MessageLookupByLibrary.simpleMessage("Delete Spell"),
        "spellDetailDice": m21,
        "spellDetailDie": m22,
        "spellDetailDistance": MessageLookupByLibrary.simpleMessage("Range"),
        "spellDetailDuration": MessageLookupByLibrary.simpleMessage("Duration"),
        "spellDetailDurationPermanent": m23,
        "spellDetailPage": MessageLookupByLibrary.simpleMessage("Page"),
        "spellDetailRemoveFromCharAffirmative":
            MessageLookupByLibrary.simpleMessage("Remove"),
        "spellDetailRemoveFromCharMessage": m24,
        "spellDetailRemoveFromCharTitle":
            MessageLookupByLibrary.simpleMessage("Remove from Character"),
        "spellLevel": m25,
        "spellSchoolLevel": m26,
        "srd":
            MessageLookupByLibrary.simpleMessage("Systems Reference Document"),
        "status": m27,
        "tcoe": MessageLookupByLibrary.simpleMessage(
            "Tasha\'s Cauldron of Everything"),
        "thrownWeaponAttacks":
            MessageLookupByLibrary.simpleMessage("Thrown Weapon Attacks"),
        "thunder": MessageLookupByLibrary.simpleMessage("Thunder"),
        "tiny": MessageLookupByLibrary.simpleMessage("tiny"),
        "touch": MessageLookupByLibrary.simpleMessage("Touch"),
        "transmutation": MessageLookupByLibrary.simpleMessage("Transmutation"),
        "trigger": MessageLookupByLibrary.simpleMessage("triggered"),
        "uiCancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "uiDone": MessageLookupByLibrary.simpleMessage("Done"),
        "unarmedAttacks":
            MessageLookupByLibrary.simpleMessage("Unarmed attacks"),
        "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
        "verbal": MessageLookupByLibrary.simpleMessage("Verbal"),
        "visibility": m28,
        "warlock": MessageLookupByLibrary.simpleMessage("Warlock"),
        "wizard": MessageLookupByLibrary.simpleMessage("Wizard"),
        "xge": MessageLookupByLibrary.simpleMessage(
            "Xanathar\'s Guide to Everything"),
        "xphb":
            MessageLookupByLibrary.simpleMessage("Player\'s Handbook (2024)")
      };
}
