// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
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
  String get localeName => 'de';

  static String m0(count) =>
      "${Intl.plural(count, one: '1 Aktion', other: '${count} Aktionen')}";

  static String m1(action) => "${Intl.select(action, {
            'attack': 'Angriff',
            'dash': 'Spurt',
            'disengage': 'Rückzug',
            'hide': 'Verstecken',
            'use_an_object': 'Gegenstand benutzen',
            'other': 'Fehler',
          })}";

  static String m2(count) =>
      "${Intl.plural(count, one: '1 Bonusaktion', other: '${count} Bonusaktionen')}";

  static String m3(name) =>
      "Sind Sie sich sicher, dass Sie den Charakter ${name} löschen wollen?\nDies kann nicht rückgängig gemacht werden.";

  static String m4(cond) => "${Intl.select(cond, {
            'blinded': 'Blind',
            'charmed': 'Bezaubert',
            'deafened': 'Taub',
            'frightened': 'Verängstigt',
            'grappled': 'Gepackt',
            'incapacitated': 'Kampfunfähig',
            'invisible': 'Unsichtbar',
            'paralyzed': 'Gelähmt',
            'petrified': 'Versteinert',
            'poisoned': 'Vergiftet',
            'prone': 'Liegend',
            'restrained': 'Festgesetzt',
            'stunned': 'Betäubt',
            'unconscious': 'Bewusstlos',
            'exhaustion': 'Erschöpft',
            'other': 'Fehler',
          })}";

  static String m5(cover) => "${Intl.select(cover, {
            'half_cover': 'Teildeckung',
            'three_quarters_cover': 'Dreivierteldeckung',
            'total_cover': 'Volle Deckung',
            'other': 'Fehler',
          })}";

  static String m6(count) => "${count} Fuß";

  static String m7(count) =>
      "${Intl.plural(count, one: '1 Stunde', other: '${count} Stunden')}";

  static String m8(count) => "${count} Kilometer";

  static String m9(light) => "${Intl.select(light, {
            'bright_light': 'Helles Licht',
            'dim_light': 'Dämmriges Licht',
            'darkness': 'Dunkelheit',
            'other': 'Fehler',
          })}";

  static String m10(count) =>
      "${Intl.plural(count, one: '1 Meter', other: '${count} Meter')}";

  static String m11(count) =>
      "${Intl.plural(count, one: '1 Meile', other: '${count} Meilen')}";

  static String m12(count) =>
      "${Intl.plural(count, one: '1 Minute', other: '${count} Minuten')}";

  static String m13(count) =>
      "${Intl.plural(count, one: '1 Reaktion', other: '${count} Reaktionen')}";

  static String m14(count) =>
      "${Intl.plural(count, one: '1 Runde', other: '${count} Runden')}";

  static String m15(count) =>
      "${Intl.plural(count, one: '1 Sekunde', other: '${count} Sekunden')}";

  static String m16(sense) => "${Intl.select(sense, {
            'darkvision': 'Dunkelsicht',
            'truesight': 'Wahrer Blick',
            'blindsight': 'Blindsicht',
            'other': 'Fehler',
          })}";

  static String m17(lang) => "${Intl.select(lang, {
            'en': 'Englisch',
            'de': 'Deutsch',
            'other': 'Fehler',
          })}";

  static String m18(skill) => "${Intl.select(skill, {
            'athletics': 'Athletik',
            'acrobatics': 'Akrobatik',
            'sleight_of_hand': 'Fingerfertigkeit',
            'stealth': 'Heimlichkeit',
            'arcana': 'Arkane Kunde',
            'history': 'Geschichte',
            'investigation': 'Nachforschung',
            'nature': 'Naturkunde',
            'religion': 'Religion',
            'animal_handling': 'Mit Tieren umgehen',
            'insight': 'Motiv Erkennen',
            'medicine': 'Heilkunde',
            'perception': 'Wahrnehmung',
            'survival': 'Überlebenskunst',
            'deception': 'Täuschung',
            'intimidation': 'Einschüchtern',
            'performance': 'Auftreten',
            'persuasion': 'Überzeugen',
            'other': 'Fehler',
          })}";

  static String m19(selectSpecies) => "${Intl.select(selectSpecies, {
            'half_elf': 'Halbelf',
            'half_orc': 'Halbork',
            'dragonborn': 'Drachenblütige',
            'human': 'Mensch',
            'tiefling': 'Tiefling',
            'dwarf': 'Zwerg',
            'dwarf_hill': 'Hügelzwertg',
            'dwarf_mountain': 'Gebirgszwerg',
            'elf': 'Elf',
            'elf_drow': 'Drow',
            'elf_high': 'Hochelf',
            'elf_wood': 'Waldelf',
            'halfling': 'Halbling',
            'halfling_stout': 'Stämmiger Halbling',
            'halfling_lightfoot': 'Leichtfuss Halbling',
            'aasimar': 'Aasimar',
            'gnome': 'Gnom',
            'gnome_forest': 'Wald-Gnom',
            'gnome_rock': 'Felsen-Gnom',
            'goliath': 'Goliath',
            'orc': 'Ork',
            'aarakocra': 'Aarakocra',
            'air_genasi': 'Luft-Genasi',
            'bugbear': 'Bugbear',
            'centaur': 'Zentaure',
            'changeling': 'Wechselbalg',
            'deep_gnome': 'Tiefengnom',
            'duergar': 'Duergar',
            'earth_genasi': 'Erd-Genasi',
            'eladrin': 'Eladrin',
            'fairy': 'Fee',
            'firbolg': 'Firbolg',
            'fire_genasi': 'Feuer-Genasi',
            'githyanki': 'Githyanki',
            'githzerai': 'Githzerai',
            'goblin': 'Goblin',
            'harengon': 'Harengon',
            'hobgoblin': 'Hobgoblin',
            'kenku': 'Kenku',
            'kobold': 'Kobold',
            'lizardfolk': 'Echsenmensch',
            'minotaur': 'Minotaur',
            'satyr': 'Satyr',
            'sea_elf': 'Meereself',
            'shadar_kai': 'Shadar-kai',
            'shifter': 'Wandler',
            'tabaxi': 'Tabaxi',
            'tortle': 'Tortel',
            'triton': 'Triton',
            'water_genasi': 'Wasser-Genasi',
            'yuan_ti': 'Yuan-ti',
            'kender': 'Kender',
            'other': 'Fehler',
          })}";

  static String m20(amount) => "${amount} Zauber";

  static String m21(name) =>
      "Sind Sie sich sicher, dass Sie den Zauber ***${name}*** löschen wollen?\nDies kann nicht rückgängig gemacht werden.";

  static String m22(numberDice, typeDie) => "${numberDice}W${typeDie}";

  static String m23(typeDie) => "W${typeDie}";

  static String m24(condition) => "bis der Zauber ${condition} wird ";

  static String m25(name, charname) =>
      "Sind sie sicher, dass ***${name}*** von Charakter ***${charname}*** entfernt werden soll?";

  static String m26(lvl) =>
      "${Intl.plural(lvl, zero: 'Zaubertrick', other: '${lvl}. Grad')}";

  static String m27(lvl, school) =>
      "${Intl.plural(lvl, zero: 'Zaubertrick der ${school}', other: '${school} des ${lvl}. Grades')}";

  static String m28(status) => "${Intl.select(status, {
            'concentration': 'Konzentration',
            'surprised': 'Überrascht',
            'other': 'Fehler',
          })}";

  static String m29(visibility) => "${Intl.select(visibility, {
            'lightly_obscured': 'Leicht verschleiert',
            'heavily_obscured': 'Komplett verschleiert',
            'other': 'Fehler',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "abjuration": MessageLookupByLibrary.simpleMessage("Bannmagie"),
        "acid": MessageLookupByLibrary.simpleMessage("Säure"),
        "action": m0,
        "actions": m1,
        "ai": MessageLookupByLibrary.simpleMessage("Acquisitions Incorporated"),
        "artificer": MessageLookupByLibrary.simpleMessage("Werkmeister"),
        "ascending": MessageLookupByLibrary.simpleMessage("Aufsteigend"),
        "attackType": MessageLookupByLibrary.simpleMessage("Schadenstyp"),
        "aventh": MessageLookupByLibrary.simpleMessage("Aventurische Helden"),
        "aventm": MessageLookupByLibrary.simpleMessage("Aventurische Monster"),
        "barbarian": MessageLookupByLibrary.simpleMessage("Barbar"),
        "bard": MessageLookupByLibrary.simpleMessage("Barde"),
        "bludgeoning": MessageLookupByLibrary.simpleMessage("Wuchtschaden"),
        "bomt": MessageLookupByLibrary.simpleMessage("The Book of Many Things"),
        "bonusAction": m2,
        "characterAddTitle":
            MessageLookupByLibrary.simpleMessage("Charakter hinzufügen"),
        "characterClass":
            MessageLookupByLibrary.simpleMessage("Klasse des Charakters"),
        "characterDeleteMessage": m3,
        "characterDeleteOk": MessageLookupByLibrary.simpleMessage("Löschen"),
        "characterDeleteTitle":
            MessageLookupByLibrary.simpleMessage("Charakter löschen"),
        "characterEditTitle":
            MessageLookupByLibrary.simpleMessage("Charakter editieren"),
        "characterName": MessageLookupByLibrary.simpleMessage("Charakter Name"),
        "characterNoSpells": MessageLookupByLibrary.simpleMessage(
            "Es sind noch keine Zauber vorhanden. Verwenden Sie den Knopf in den Einstellungen, um Zauber zu importieren."),
        "cleric": MessageLookupByLibrary.simpleMessage("Kleriker"),
        "cold": MessageLookupByLibrary.simpleMessage("Frost"),
        "concentration": MessageLookupByLibrary.simpleMessage("Konzentration"),
        "condition": m4,
        "conjuration": MessageLookupByLibrary.simpleMessage("Beschwörung"),
        "cover": m5,
        "cthulhu": MessageLookupByLibrary.simpleMessage(
            "Sandy Petersens Cthulhu Mythos"),
        "descending": MessageLookupByLibrary.simpleMessage("Absteigend"),
        "difficultTerrain":
            MessageLookupByLibrary.simpleMessage("schwieriges Gelände"),
        "dispel": MessageLookupByLibrary.simpleMessage("gebannt"),
        "divination": MessageLookupByLibrary.simpleMessage("Erkenntnismagie"),
        "dndClass": MessageLookupByLibrary.simpleMessage("Klasse"),
        "dosi": MessageLookupByLibrary.simpleMessage(
            "Die Drachen der Sturmwrack-Insel"),
        "druid": MessageLookupByLibrary.simpleMessage("Druide"),
        "eepc": MessageLookupByLibrary.simpleMessage(
            "Elemental Evil Player’s Companion"),
        "egtw": MessageLookupByLibrary.simpleMessage(
            "Explorer\'s Guide to Wildemount"),
        "enchantment": MessageLookupByLibrary.simpleMessage("Verzauberung"),
        "evocation": MessageLookupByLibrary.simpleMessage("Hervorrufung"),
        "feet": MessageLookupByLibrary.simpleMessage("Fuß"),
        "feetForUi": m6,
        "ff2g":
            MessageLookupByLibrary.simpleMessage("Fateforge: 2. Die Erwachten"),
        "ff3c": MessageLookupByLibrary.simpleMessage("Fateforge: 3. Creatures"),
        "fighter": MessageLookupByLibrary.simpleMessage("Kämpfer"),
        "filterCastTime": MessageLookupByLibrary.simpleMessage("Zauberzeit"),
        "filterClasses": MessageLookupByLibrary.simpleMessage("Klassen"),
        "filterDamage": MessageLookupByLibrary.simpleMessage("Schadenstyp"),
        "filterLevel": MessageLookupByLibrary.simpleMessage("Grad"),
        "filterReset":
            MessageLookupByLibrary.simpleMessage("Filter zurücksetzen"),
        "filterSchool": MessageLookupByLibrary.simpleMessage("Schule"),
        "filterSpells": MessageLookupByLibrary.simpleMessage("Zauber filtern"),
        "filterUnselect": MessageLookupByLibrary.simpleMessage("Alle abwählen"),
        "fire": MessageLookupByLibrary.simpleMessage("Feuer"),
        "force": MessageLookupByLibrary.simpleMessage("Energie"),
        "ftod": MessageLookupByLibrary.simpleMessage(
            "Fizbans Schatzkammer der Drachen"),
        "homebrew": MessageLookupByLibrary.simpleMessage("Homebrew"),
        "hour": m7,
        "huge": MessageLookupByLibrary.simpleMessage("Riesig"),
        "humblewood": MessageLookupByLibrary.simpleMessage("Humblewood"),
        "idrotf": MessageLookupByLibrary.simpleMessage(
            "Eiswindtal: Ode der Frostmaid"),
        "illusion": MessageLookupByLibrary.simpleMessage("Illusion"),
        "instantaneous": MessageLookupByLibrary.simpleMessage("Sofort"),
        "km": MessageLookupByLibrary.simpleMessage("Kilometer"),
        "kmForUi": m8,
        "large": MessageLookupByLibrary.simpleMessage("Groß"),
        "level": MessageLookupByLibrary.simpleMessage("Zaubergrad"),
        "light": m9,
        "lightning": MessageLookupByLibrary.simpleMessage("Blitz"),
        "longbow": MessageLookupByLibrary.simpleMessage("Langbogen"),
        "mainScreenSettings":
            MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "mainScreenSpellBooks":
            MessageLookupByLibrary.simpleMessage("Charaktere"),
        "mainScreenSpellList":
            MessageLookupByLibrary.simpleMessage("Zauberliste"),
        "material": MessageLookupByLibrary.simpleMessage("Material"),
        "medium": MessageLookupByLibrary.simpleMessage("Mittelgroß"),
        "meleeWeaponAttacks":
            MessageLookupByLibrary.simpleMessage("Nahkampfangriffe"),
        "meter": MessageLookupByLibrary.simpleMessage("Meter"),
        "meterForUi": m10,
        "mile": MessageLookupByLibrary.simpleMessage("Meile"),
        "mileForUi": m11,
        "minute": m12,
        "monk": MessageLookupByLibrary.simpleMessage("Mönch"),
        "mtgafr": MessageLookupByLibrary.simpleMessage(
            "Abenteuer in den Forgotten Realms"),
        "mythaddm": MessageLookupByLibrary.simpleMessage(
            "Mythgart Abenteuer des Dunklen Meisters"),
        "mythheld": MessageLookupByLibrary.simpleMessage(
            "Mythgart Handbuch der Helden"),
        "mythsaga": MessageLookupByLibrary.simpleMessage("Mythgart Sagas"),
        "mythwelt": MessageLookupByLibrary.simpleMessage("Mythgart Weltenbuch"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "naturalAttacks":
            MessageLookupByLibrary.simpleMessage("Natürliche Angriffe"),
        "necromancy": MessageLookupByLibrary.simpleMessage("Nekromantie"),
        "necrotic": MessageLookupByLibrary.simpleMessage("Nekrotisch"),
        "onHigherLevels":
            MessageLookupByLibrary.simpleMessage("Auf höheren Graden"),
        "oneHandedMeleeAttacks":
            MessageLookupByLibrary.simpleMessage("Einhändige Nahkampfangriffe"),
        "or": MessageLookupByLibrary.simpleMessage("oder"),
        "paladin": MessageLookupByLibrary.simpleMessage("Paladin"),
        "pamsato": MessageLookupByLibrary.simpleMessage(
            "Planescape Adventures in the Multiverse: Sigil and the Outlands"),
        "phb": MessageLookupByLibrary.simpleMessage("Spielerhandbuch (2014)"),
        "piercing": MessageLookupByLibrary.simpleMessage("Stich"),
        "poison": MessageLookupByLibrary.simpleMessage("Gift"),
        "pota": MessageLookupByLibrary.simpleMessage("Prinzen der Apokalypse"),
        "psychic": MessageLookupByLibrary.simpleMessage("Psychisch"),
        "radiant": MessageLookupByLibrary.simpleMessage("Gleißend"),
        "ragnarok": MessageLookupByLibrary.simpleMessage("Journey to Ragnarok"),
        "ranger": MessageLookupByLibrary.simpleMessage("Waldläufer"),
        "reaction": m13,
        "rogue": MessageLookupByLibrary.simpleMessage("Schurke"),
        "round": m14,
        "sasaag": MessageLookupByLibrary.simpleMessage(
            "Spelljammer Adventures in Space: Astral Adventurer\'s Guide"),
        "scag": MessageLookupByLibrary.simpleMessage(
            "Abenteurerhandbuch der Schwertküste"),
        "scc": MessageLookupByLibrary.simpleMessage(
            "Strixhaven: A Curriculum of Chaos"),
        "school": MessageLookupByLibrary.simpleMessage("Zauberschule"),
        "searchSpells": MessageLookupByLibrary.simpleMessage("Zauber suchen"),
        "second": m15,
        "self": MessageLookupByLibrary.simpleMessage("Selbst"),
        "senses": m16,
        "settings5eMessage": MessageLookupByLibrary.simpleMessage(
            "Dieser Import ist nur für json-Dateien von 5e-Tools gedacht und nicht für einen Import von Daten dieser App."),
        "settingsAppMessage": MessageLookupByLibrary.simpleMessage(
            "Dieser Import ist nur für die Daten dieser App gedacht und nicht für Daten von 5e-Tools.\nDer Import wird eventuell Daten überschreiben."),
        "settingsAppVersionLabel":
            MessageLookupByLibrary.simpleMessage("App-Version"),
        "settingsData": MessageLookupByLibrary.simpleMessage("Daten Optionen"),
        "settingsDeleteData":
            MessageLookupByLibrary.simpleMessage("App-Daten löschen"),
        "settingsDeleteMessage": MessageLookupByLibrary.simpleMessage(
            "Achtung: Das Löschen kann nicht rückgängig gemacht werden."),
        "settingsDistanceType":
            MessageLookupByLibrary.simpleMessage("Einheit auswählen"),
        "settingsDoNotShowMessageAgain": MessageLookupByLibrary.simpleMessage(
            "Diese Nachricht nicht erneut anzeigen"),
        "settingsExportData":
            MessageLookupByLibrary.simpleMessage("App-Daten exportieren"),
        "settingsExportMessage": MessageLookupByLibrary.simpleMessage(
            "Daten erfolgreich in den Downloads-Ordner exportiert"),
        "settingsExportMessageFail": MessageLookupByLibrary.simpleMessage(
            "Fehler: Export nicht möglich"),
        "settingsImport5e":
            MessageLookupByLibrary.simpleMessage("5eTools Zauber importieren"),
        "settingsImportData":
            MessageLookupByLibrary.simpleMessage("App-Daten importieren"),
        "settingsLanguage": MessageLookupByLibrary.simpleMessage("Sprache"),
        "settingsLanguageDescription": MessageLookupByLibrary.simpleMessage(
            "Die Sprache wirkt sich nur auf das Interface aus"),
        "settingsLanguageLabel":
            MessageLookupByLibrary.simpleMessage("Sprache auswählen"),
        "settingsLanguages": m17,
        "shortbow": MessageLookupByLibrary.simpleMessage("Kurzbogen"),
        "skills": m18,
        "slashing": MessageLookupByLibrary.simpleMessage("Klinge"),
        "small": MessageLookupByLibrary.simpleMessage("Klein"),
        "somatic": MessageLookupByLibrary.simpleMessage("Geste"),
        "sorcerer": MessageLookupByLibrary.simpleMessage("Magier"),
        "sortBy": MessageLookupByLibrary.simpleMessage("Sortieren nach"),
        "source": MessageLookupByLibrary.simpleMessage("Quelle"),
        "special": MessageLookupByLibrary.simpleMessage("Speziell"),
        "species": m19,
        "spellBookSearchCharacter":
            MessageLookupByLibrary.simpleMessage("Charakter suchen"),
        "spellBookSpellCount": m20,
        "spellCount": MessageLookupByLibrary.simpleMessage("Anzahl Zauber"),
        "spellDetailAddSpellNoChars": MessageLookupByLibrary.simpleMessage(
            "Keine Charaktere vorhanden. Erstelle einen Charakter, dem du etwas hinzufügen willst."),
        "spellDetailAddSpellTitle":
            MessageLookupByLibrary.simpleMessage("Zum Charakter hinzufügen"),
        "spellDetailCastTime":
            MessageLookupByLibrary.simpleMessage("Zeitaufwand"),
        "spellDetailClasses": MessageLookupByLibrary.simpleMessage("Klassen"),
        "spellDetailComponents":
            MessageLookupByLibrary.simpleMessage("Komponenten"),
        "spellDetailDeleteMessage": m21,
        "spellDetailDeleteTitle":
            MessageLookupByLibrary.simpleMessage("Zauber löschen"),
        "spellDetailDice": m22,
        "spellDetailDie": m23,
        "spellDetailDistance":
            MessageLookupByLibrary.simpleMessage("Reichweite"),
        "spellDetailDuration":
            MessageLookupByLibrary.simpleMessage("Wirkungsdauer"),
        "spellDetailDurationPermanent": m24,
        "spellDetailPage": MessageLookupByLibrary.simpleMessage("Seite"),
        "spellDetailRemoveFromCharAffirmative":
            MessageLookupByLibrary.simpleMessage("Entfernen"),
        "spellDetailRemoveFromCharMessage": m25,
        "spellDetailRemoveFromCharTitle":
            MessageLookupByLibrary.simpleMessage("Von Charakter entfernen"),
        "spellLevel": m26,
        "spellSchoolLevel": m27,
        "srd": MessageLookupByLibrary.simpleMessage("Systemreferenzdokument"),
        "status": m28,
        "tcoe": MessageLookupByLibrary.simpleMessage("Tashas Kessel mit Allem"),
        "thrownWeaponAttacks":
            MessageLookupByLibrary.simpleMessage("Wurfwaffenangriffe"),
        "thunder": MessageLookupByLibrary.simpleMessage("Donner"),
        "tiny": MessageLookupByLibrary.simpleMessage("Sehr klein"),
        "touch": MessageLookupByLibrary.simpleMessage("Berührung"),
        "transmutation": MessageLookupByLibrary.simpleMessage("Verwandlung"),
        "trigger": MessageLookupByLibrary.simpleMessage("ausgelöst"),
        "uiCancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
        "uiDone": MessageLookupByLibrary.simpleMessage("Fertig"),
        "uiOK": MessageLookupByLibrary.simpleMessage("Ok"),
        "unarmedAttacks": MessageLookupByLibrary.simpleMessage(
            "Unbewaffnete Nahkampfangriffe"),
        "unknown": MessageLookupByLibrary.simpleMessage("Unbekannt"),
        "verbal": MessageLookupByLibrary.simpleMessage("Verbal"),
        "visibility": m29,
        "warlock": MessageLookupByLibrary.simpleMessage("Hexenmeister"),
        "wizard": MessageLookupByLibrary.simpleMessage("Zauberer"),
        "xge": MessageLookupByLibrary.simpleMessage(
            "Xanathars Ratgeber für Alles"),
        "xphb": MessageLookupByLibrary.simpleMessage("Spielerhandbuch (2024)")
      };
}
