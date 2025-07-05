// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Selbst`
  String get self {
    return Intl.message(
      'Selbst',
      name: 'self',
      desc: '',
      args: [],
    );
  }

  /// `Fuß`
  String get feet {
    return Intl.message(
      'Fuß',
      name: 'feet',
      desc: '',
      args: [],
    );
  }

  /// `Meter`
  String get meter {
    return Intl.message(
      'Meter',
      name: 'meter',
      desc: '',
      args: [],
    );
  }

  /// `Kilometer`
  String get km {
    return Intl.message(
      'Kilometer',
      name: 'km',
      desc: '',
      args: [],
    );
  }

  /// `Meile`
  String get mile {
    return Intl.message(
      'Meile',
      name: 'mile',
      desc: '',
      args: [],
    );
  }

  /// `Berührung`
  String get touch {
    return Intl.message(
      'Berührung',
      name: 'touch',
      desc: '',
      args: [],
    );
  }

  /// `Speziell`
  String get special {
    return Intl.message(
      'Speziell',
      name: 'special',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural,=1{1 Meter} other{{count} Meter}}`
  String meterForUi(num count) {
    return Intl.plural(
      count,
      one: '1 Meter',
      other: '$count Meter',
      name: 'meterForUi',
      desc: 'Counting Meter',
      args: [count],
    );
  }

  /// `{count} Fuß`
  String feetForUi(num count) {
    final NumberFormat countNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String countString = countNumberFormat.format(count);

    return Intl.message(
      '$countString Fuß',
      name: 'feetForUi',
      desc: 'Counting Feet',
      args: [countString],
    );
  }

  /// `{count} Kilometer`
  String kmForUi(num count) {
    final NumberFormat countNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String countString = countNumberFormat.format(count);

    return Intl.message(
      '$countString Kilometer',
      name: 'kmForUi',
      desc: 'Counting Kilometers',
      args: [countString],
    );
  }

  /// `{count, plural,=1{1 Meile} other{{count} Meilen}}`
  String mileForUi(num count) {
    return Intl.plural(
      count,
      one: '1 Meile',
      other: '$count Meilen',
      name: 'mileForUi',
      desc: 'Counting Miles',
      args: [count],
    );
  }

  /// `Sehr klein`
  String get tiny {
    return Intl.message(
      'Sehr klein',
      name: 'tiny',
      desc: '',
      args: [],
    );
  }

  /// `Klein`
  String get small {
    return Intl.message(
      'Klein',
      name: 'small',
      desc: '',
      args: [],
    );
  }

  /// `Mittelgroß`
  String get medium {
    return Intl.message(
      'Mittelgroß',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Groß`
  String get large {
    return Intl.message(
      'Groß',
      name: 'large',
      desc: '',
      args: [],
    );
  }

  /// `Riesig`
  String get huge {
    return Intl.message(
      'Riesig',
      name: 'huge',
      desc: '',
      args: [],
    );
  }

  /// `{action, select, attack {Angriff} dash {Spurt} disengage {Rückzug} hide {Verstecken} use_an_object {Gegenstand benutzen} other {Fehler}}`
  String actions(String action) {
    return Intl.select(
      action,
      {
        'attack': 'Angriff',
        'dash': 'Spurt',
        'disengage': 'Rückzug',
        'hide': 'Verstecken',
        'use_an_object': 'Gegenstand benutzen',
        'other': 'Fehler',
      },
      name: 'actions',
      desc: 'translation of possible actions',
      args: [action],
    );
  }

  /// `{skill, select, athletics {Athletik} acrobatics {Akrobatik} sleight_of_hand {Fingerfertigkeit} stealth {Heimlichkeit} arcana {Arkane Kunde} history {Geschichte} investigation {Nachforschung} nature {Naturkunde} religion {Religion} animal_handling {Mit Tieren umgehen} insight {Motiv Erkennen} medicine {Heilkunde} perception {Wahrnehmung} survival {Überlebenskunst} deception {Täuschung} intimidation {Einschüchtern} performance {Auftreten} persuasion {Überzeugen} other {Fehler}}`
  String skills(String skill) {
    return Intl.select(
      skill,
      {
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
      },
      name: 'skills',
      desc: 'translation of possible skills',
      args: [skill],
    );
  }

  /// `{selectSpecies, select, half_elf {Halbelf} half_orc {Halbork} dragonborn {Drachenblütige} human {Mensch} tiefling {Tiefling} dwarf {Zwerg} dwarf_hill {Hügelzwertg} dwarf_mountain {Gebirgszwerg} elf {Elf} elf_drow{Drow} elf_high {Hochelf} elf_wood {Waldelf} halfling {Halbling} halfling_stout {Stämmiger Halbling} halfling_lightfoot {Leichtfuss Halbling} aasimar {Aasimar} gnome {Gnom} gnome_forest {Wald-Gnom} gnome_rock {Felsen-Gnom} goliath {Goliath} orc {Ork} aarakocra {Aarakocra} air_genasi {Luft-Genasi} bugbear {Bugbear} centaur {Zentaure} changeling {Wechselbalg} deep_gnome {Tiefengnom} duergar {Duergar} earth_genasi {Erd-Genasi} eladrin {Eladrin} fairy {Fee} firbolg {Firbolg} fire_genasi {Feuer-Genasi} githyanki {Githyanki} githzerai {Githzerai} goblin {Goblin} harengon {Harengon} hobgoblin {Hobgoblin} kenku {Kenku} kobold {Kobold} lizardfolk {Echsenmensch} minotaur {Minotaur} satyr {Satyr} sea_elf {Meereself} shadar_kai {Shadar-kai} shifter {Wandler} tabaxi {Tabaxi} tortle {Tortel} triton {Triton} water_genasi {Wasser-Genasi} yuan_ti {Yuan-ti} kender {Kender} other {Fehler}}`
  String species(String selectSpecies) {
    return Intl.select(
      selectSpecies,
      {
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
      },
      name: 'species',
      desc: 'translation of possible species ',
      args: [selectSpecies],
    );
  }

  /// `{sense, select, darkvision {Dunkelsicht} truesight {Wahrer Blick} blindsight {Blindsicht} other {Fehler}}`
  String senses(String sense) {
    return Intl.select(
      sense,
      {
        'darkvision': 'Dunkelsicht',
        'truesight': 'Wahrer Blick',
        'blindsight': 'Blindsicht',
        'other': 'Fehler',
      },
      name: 'senses',
      desc: 'translation of possible actions',
      args: [sense],
    );
  }

  /// `{status, select, concentration {Konzentration} surprised {Überrascht} other {Fehler}}`
  String status(String status) {
    return Intl.select(
      status,
      {
        'concentration': 'Konzentration',
        'surprised': 'Überrascht',
        'other': 'Fehler',
      },
      name: 'status',
      desc: 'translation of possible actions',
      args: [status],
    );
  }

  /// `{cover, select, half_cover {Teildeckung} three_quarters_cover {Dreivierteldeckung} total_cover {Volle Deckung} other {Fehler}}`
  String cover(String cover) {
    return Intl.select(
      cover,
      {
        'half_cover': 'Teildeckung',
        'three_quarters_cover': 'Dreivierteldeckung',
        'total_cover': 'Volle Deckung',
        'other': 'Fehler',
      },
      name: 'cover',
      desc: 'translation of possible cover',
      args: [cover],
    );
  }

  /// `{light, select, bright_light {Helles Licht} dim_light {Dämmriges Licht} darkness {Dunkelheit} other {Fehler}}`
  String light(String light) {
    return Intl.select(
      light,
      {
        'bright_light': 'Helles Licht',
        'dim_light': 'Dämmriges Licht',
        'darkness': 'Dunkelheit',
        'other': 'Fehler',
      },
      name: 'light',
      desc: 'translation of possible light',
      args: [light],
    );
  }

  /// `{visibility, select, lightly_obscured {Leicht verschleiert} heavily_obscured {Komplett verschleiert} other {Fehler}}`
  String visibility(String visibility) {
    return Intl.select(
      visibility,
      {
        'lightly_obscured': 'Leicht verschleiert',
        'heavily_obscured': 'Komplett verschleiert',
        'other': 'Fehler',
      },
      name: 'visibility',
      desc: 'translation of possible visibility',
      args: [visibility],
    );
  }

  /// `schwieriges Gelände`
  String get difficultTerrain {
    return Intl.message(
      'schwieriges Gelände',
      name: 'difficultTerrain',
      desc: '',
      args: [],
    );
  }

  /// `Werkmeister`
  String get artificer {
    return Intl.message(
      'Werkmeister',
      name: 'artificer',
      desc: '',
      args: [],
    );
  }

  /// `Barbar`
  String get barbarian {
    return Intl.message(
      'Barbar',
      name: 'barbarian',
      desc: '',
      args: [],
    );
  }

  /// `Barde`
  String get bard {
    return Intl.message(
      'Barde',
      name: 'bard',
      desc: '',
      args: [],
    );
  }

  /// `Kleriker`
  String get cleric {
    return Intl.message(
      'Kleriker',
      name: 'cleric',
      desc: '',
      args: [],
    );
  }

  /// `Druide`
  String get druid {
    return Intl.message(
      'Druide',
      name: 'druid',
      desc: '',
      args: [],
    );
  }

  /// `Kämpfer`
  String get fighter {
    return Intl.message(
      'Kämpfer',
      name: 'fighter',
      desc: '',
      args: [],
    );
  }

  /// `Mönch`
  String get monk {
    return Intl.message(
      'Mönch',
      name: 'monk',
      desc: '',
      args: [],
    );
  }

  /// `Paladin`
  String get paladin {
    return Intl.message(
      'Paladin',
      name: 'paladin',
      desc: '',
      args: [],
    );
  }

  /// `Waldläufer`
  String get ranger {
    return Intl.message(
      'Waldläufer',
      name: 'ranger',
      desc: '',
      args: [],
    );
  }

  /// `Schurke`
  String get rogue {
    return Intl.message(
      'Schurke',
      name: 'rogue',
      desc: '',
      args: [],
    );
  }

  /// `Magier`
  String get sorcerer {
    return Intl.message(
      'Magier',
      name: 'sorcerer',
      desc: '',
      args: [],
    );
  }

  /// `Hexenmeister`
  String get warlock {
    return Intl.message(
      'Hexenmeister',
      name: 'warlock',
      desc: '',
      args: [],
    );
  }

  /// `Zauberer`
  String get wizard {
    return Intl.message(
      'Zauberer',
      name: 'wizard',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Zaubergrad`
  String get level {
    return Intl.message(
      'Zaubergrad',
      name: 'level',
      desc: '',
      args: [],
    );
  }

  /// `Zauberschule`
  String get school {
    return Intl.message(
      'Zauberschule',
      name: 'school',
      desc: '',
      args: [],
    );
  }

  /// `Schadenstyp`
  String get attackType {
    return Intl.message(
      'Schadenstyp',
      name: 'attackType',
      desc: '',
      args: [],
    );
  }

  /// `Quelle`
  String get source {
    return Intl.message(
      'Quelle',
      name: 'source',
      desc: '',
      args: [],
    );
  }

  /// `Klasse`
  String get dndClass {
    return Intl.message(
      'Klasse',
      name: 'dndClass',
      desc: '',
      args: [],
    );
  }

  /// `Anzahl Zauber`
  String get spellCount {
    return Intl.message(
      'Anzahl Zauber',
      name: 'spellCount',
      desc: '',
      args: [],
    );
  }

  /// `Sortieren nach`
  String get sortBy {
    return Intl.message(
      'Sortieren nach',
      name: 'sortBy',
      desc: '',
      args: [],
    );
  }

  /// `Aufsteigend`
  String get ascending {
    return Intl.message(
      'Aufsteigend',
      name: 'ascending',
      desc: '',
      args: [],
    );
  }

  /// `Absteigend`
  String get descending {
    return Intl.message(
      'Absteigend',
      name: 'descending',
      desc: '',
      args: [],
    );
  }

  /// `Verbal`
  String get verbal {
    return Intl.message(
      'Verbal',
      name: 'verbal',
      desc: '',
      args: [],
    );
  }

  /// `Geste`
  String get somatic {
    return Intl.message(
      'Geste',
      name: 'somatic',
      desc: '',
      args: [],
    );
  }

  /// `Material`
  String get material {
    return Intl.message(
      'Material',
      name: 'material',
      desc: '',
      args: [],
    );
  }

  /// `Säure`
  String get acid {
    return Intl.message(
      'Säure',
      name: 'acid',
      desc: '',
      args: [],
    );
  }

  /// `Wuchtschaden`
  String get bludgeoning {
    return Intl.message(
      'Wuchtschaden',
      name: 'bludgeoning',
      desc: '',
      args: [],
    );
  }

  /// `Frost`
  String get cold {
    return Intl.message(
      'Frost',
      name: 'cold',
      desc: '',
      args: [],
    );
  }

  /// `Feuer`
  String get fire {
    return Intl.message(
      'Feuer',
      name: 'fire',
      desc: '',
      args: [],
    );
  }

  /// `Energie`
  String get force {
    return Intl.message(
      'Energie',
      name: 'force',
      desc: '',
      args: [],
    );
  }

  /// `Blitz`
  String get lightning {
    return Intl.message(
      'Blitz',
      name: 'lightning',
      desc: '',
      args: [],
    );
  }

  /// `Nekrotisch`
  String get necrotic {
    return Intl.message(
      'Nekrotisch',
      name: 'necrotic',
      desc: '',
      args: [],
    );
  }

  /// `Stich`
  String get piercing {
    return Intl.message(
      'Stich',
      name: 'piercing',
      desc: '',
      args: [],
    );
  }

  /// `Gift`
  String get poison {
    return Intl.message(
      'Gift',
      name: 'poison',
      desc: '',
      args: [],
    );
  }

  /// `Psychisch`
  String get psychic {
    return Intl.message(
      'Psychisch',
      name: 'psychic',
      desc: '',
      args: [],
    );
  }

  /// `Gleißend`
  String get radiant {
    return Intl.message(
      'Gleißend',
      name: 'radiant',
      desc: '',
      args: [],
    );
  }

  /// `Klinge`
  String get slashing {
    return Intl.message(
      'Klinge',
      name: 'slashing',
      desc: '',
      args: [],
    );
  }

  /// `Donner`
  String get thunder {
    return Intl.message(
      'Donner',
      name: 'thunder',
      desc: '',
      args: [],
    );
  }

  /// `Kurzbogen`
  String get shortbow {
    return Intl.message(
      'Kurzbogen',
      name: 'shortbow',
      desc: '',
      args: [],
    );
  }

  /// `Langbogen`
  String get longbow {
    return Intl.message(
      'Langbogen',
      name: 'longbow',
      desc: '',
      args: [],
    );
  }

  /// `Einhändige Nahkampfangriffe`
  String get oneHandedMeleeAttacks {
    return Intl.message(
      'Einhändige Nahkampfangriffe',
      name: 'oneHandedMeleeAttacks',
      desc: '',
      args: [],
    );
  }

  /// `Unbewaffnete Nahkampfangriffe`
  String get unarmedAttacks {
    return Intl.message(
      'Unbewaffnete Nahkampfangriffe',
      name: 'unarmedAttacks',
      desc: '',
      args: [],
    );
  }

  /// `Natürliche Angriffe`
  String get naturalAttacks {
    return Intl.message(
      'Natürliche Angriffe',
      name: 'naturalAttacks',
      desc: '',
      args: [],
    );
  }

  /// `Nahkampfangriffe`
  String get meleeWeaponAttacks {
    return Intl.message(
      'Nahkampfangriffe',
      name: 'meleeWeaponAttacks',
      desc: '',
      args: [],
    );
  }

  /// `Wurfwaffenangriffe`
  String get thrownWeaponAttacks {
    return Intl.message(
      'Wurfwaffenangriffe',
      name: 'thrownWeaponAttacks',
      desc: '',
      args: [],
    );
  }

  /// `Sofort`
  String get instantaneous {
    return Intl.message(
      'Sofort',
      name: 'instantaneous',
      desc: '',
      args: [],
    );
  }

  /// `Acquisitions Incorporated`
  String get ai {
    return Intl.message(
      'Acquisitions Incorporated',
      name: 'ai',
      desc: '',
      args: [],
    );
  }

  /// `Aventurische Helden`
  String get aventh {
    return Intl.message(
      'Aventurische Helden',
      name: 'aventh',
      desc: '',
      args: [],
    );
  }

  /// `Aventurische Monster`
  String get aventm {
    return Intl.message(
      'Aventurische Monster',
      name: 'aventm',
      desc: '',
      args: [],
    );
  }

  /// `The Book of Many Things`
  String get bomt {
    return Intl.message(
      'The Book of Many Things',
      name: 'bomt',
      desc: '',
      args: [],
    );
  }

  /// `Sandy Petersens Cthulhu Mythos`
  String get cthulhu {
    return Intl.message(
      'Sandy Petersens Cthulhu Mythos',
      name: 'cthulhu',
      desc: '',
      args: [],
    );
  }

  /// `Die Drachen der Sturmwrack-Insel`
  String get dosi {
    return Intl.message(
      'Die Drachen der Sturmwrack-Insel',
      name: 'dosi',
      desc: '',
      args: [],
    );
  }

  /// `Elemental Evil Player’s Companion`
  String get eepc {
    return Intl.message(
      'Elemental Evil Player’s Companion',
      name: 'eepc',
      desc: '',
      args: [],
    );
  }

  /// `Explorer's Guide to Wildemount`
  String get egtw {
    return Intl.message(
      'Explorer\'s Guide to Wildemount',
      name: 'egtw',
      desc: '',
      args: [],
    );
  }

  /// `Fateforge: 2. Die Erwachten`
  String get ff2g {
    return Intl.message(
      'Fateforge: 2. Die Erwachten',
      name: 'ff2g',
      desc: '',
      args: [],
    );
  }

  /// `Fateforge: 3. Creatures`
  String get ff3c {
    return Intl.message(
      'Fateforge: 3. Creatures',
      name: 'ff3c',
      desc: '',
      args: [],
    );
  }

  /// `Fizbans Schatzkammer der Drachen`
  String get ftod {
    return Intl.message(
      'Fizbans Schatzkammer der Drachen',
      name: 'ftod',
      desc: '',
      args: [],
    );
  }

  /// `Humblewood`
  String get humblewood {
    return Intl.message(
      'Humblewood',
      name: 'humblewood',
      desc: '',
      args: [],
    );
  }

  /// `Eiswindtal: Ode der Frostmaid`
  String get idrotf {
    return Intl.message(
      'Eiswindtal: Ode der Frostmaid',
      name: 'idrotf',
      desc: '',
      args: [],
    );
  }

  /// `Abenteuer in den Forgotten Realms`
  String get mtgafr {
    return Intl.message(
      'Abenteuer in den Forgotten Realms',
      name: 'mtgafr',
      desc: '',
      args: [],
    );
  }

  /// `Mythgart Abenteuer des Dunklen Meisters`
  String get mythaddm {
    return Intl.message(
      'Mythgart Abenteuer des Dunklen Meisters',
      name: 'mythaddm',
      desc: '',
      args: [],
    );
  }

  /// `Mythgart Handbuch der Helden`
  String get mythheld {
    return Intl.message(
      'Mythgart Handbuch der Helden',
      name: 'mythheld',
      desc: '',
      args: [],
    );
  }

  /// `Mythgart Sagas`
  String get mythsaga {
    return Intl.message(
      'Mythgart Sagas',
      name: 'mythsaga',
      desc: '',
      args: [],
    );
  }

  /// `Mythgart Weltenbuch`
  String get mythwelt {
    return Intl.message(
      'Mythgart Weltenbuch',
      name: 'mythwelt',
      desc: '',
      args: [],
    );
  }

  /// `Planescape Adventures in the Multiverse: Sigil and the Outlands`
  String get pamsato {
    return Intl.message(
      'Planescape Adventures in the Multiverse: Sigil and the Outlands',
      name: 'pamsato',
      desc: '',
      args: [],
    );
  }

  /// `Spielerhandbuch (2014)`
  String get phb {
    return Intl.message(
      'Spielerhandbuch (2014)',
      name: 'phb',
      desc: '',
      args: [],
    );
  }

  /// `Prinzen der Apokalypse`
  String get pota {
    return Intl.message(
      'Prinzen der Apokalypse',
      name: 'pota',
      desc: '',
      args: [],
    );
  }

  /// `Journey to Ragnarok`
  String get ragnarok {
    return Intl.message(
      'Journey to Ragnarok',
      name: 'ragnarok',
      desc: '',
      args: [],
    );
  }

  /// `Spelljammer Adventures in Space: Astral Adventurer's Guide`
  String get sasaag {
    return Intl.message(
      'Spelljammer Adventures in Space: Astral Adventurer\'s Guide',
      name: 'sasaag',
      desc: '',
      args: [],
    );
  }

  /// `Abenteurerhandbuch der Schwertküste`
  String get scag {
    return Intl.message(
      'Abenteurerhandbuch der Schwertküste',
      name: 'scag',
      desc: '',
      args: [],
    );
  }

  /// `Strixhaven: A Curriculum of Chaos`
  String get scc {
    return Intl.message(
      'Strixhaven: A Curriculum of Chaos',
      name: 'scc',
      desc: '',
      args: [],
    );
  }

  /// `Systemreferenzdokument`
  String get srd {
    return Intl.message(
      'Systemreferenzdokument',
      name: 'srd',
      desc: '',
      args: [],
    );
  }

  /// `Tashas Kessel mit Allem`
  String get tcoe {
    return Intl.message(
      'Tashas Kessel mit Allem',
      name: 'tcoe',
      desc: '',
      args: [],
    );
  }

  /// `Xanathars Ratgeber für Alles`
  String get xge {
    return Intl.message(
      'Xanathars Ratgeber für Alles',
      name: 'xge',
      desc: '',
      args: [],
    );
  }

  /// `Spielerhandbuch (2024)`
  String get xphb {
    return Intl.message(
      'Spielerhandbuch (2024)',
      name: 'xphb',
      desc: '',
      args: [],
    );
  }

  /// `Homebrew`
  String get homebrew {
    return Intl.message(
      'Homebrew',
      name: 'homebrew',
      desc: '',
      args: [],
    );
  }

  /// `{lvl, plural,=0 {Zaubertrick der {school}} other{{school} des {lvl}. Grades}}`
  String spellSchoolLevel(int lvl, String school) {
    return Intl.plural(
      lvl,
      zero: 'Zaubertrick der $school',
      other: '$school des $lvl. Grades',
      name: 'spellSchoolLevel',
      desc: 'String for displaying school and level of a spell',
      args: [lvl, school],
    );
  }

  /// `{lvl, plural,=0 {Zaubertrick} other{{lvl}. Grad}}`
  String spellLevel(int lvl) {
    return Intl.plural(
      lvl,
      zero: 'Zaubertrick',
      other: '$lvl. Grad',
      name: 'spellLevel',
      desc: 'String for displaying level of a spell',
      args: [lvl],
    );
  }

  /// `Klassen`
  String get filterClasses {
    return Intl.message(
      'Klassen',
      name: 'filterClasses',
      desc: '',
      args: [],
    );
  }

  /// `Grad`
  String get filterLevel {
    return Intl.message(
      'Grad',
      name: 'filterLevel',
      desc: '',
      args: [],
    );
  }

  /// `Zauberzeit`
  String get filterCastTime {
    return Intl.message(
      'Zauberzeit',
      name: 'filterCastTime',
      desc: '',
      args: [],
    );
  }

  /// `Schule`
  String get filterSchool {
    return Intl.message(
      'Schule',
      name: 'filterSchool',
      desc: '',
      args: [],
    );
  }

  /// `Schadenstyp`
  String get filterDamage {
    return Intl.message(
      'Schadenstyp',
      name: 'filterDamage',
      desc: '',
      args: [],
    );
  }

  /// `Bannmagie`
  String get abjuration {
    return Intl.message(
      'Bannmagie',
      name: 'abjuration',
      desc: '',
      args: [],
    );
  }

  /// `Verwandlung`
  String get transmutation {
    return Intl.message(
      'Verwandlung',
      name: 'transmutation',
      desc: '',
      args: [],
    );
  }

  /// `Beschwörung`
  String get conjuration {
    return Intl.message(
      'Beschwörung',
      name: 'conjuration',
      desc: '',
      args: [],
    );
  }

  /// `Erkenntnismagie`
  String get divination {
    return Intl.message(
      'Erkenntnismagie',
      name: 'divination',
      desc: '',
      args: [],
    );
  }

  /// `Verzauberung`
  String get enchantment {
    return Intl.message(
      'Verzauberung',
      name: 'enchantment',
      desc: '',
      args: [],
    );
  }

  /// `Illusion`
  String get illusion {
    return Intl.message(
      'Illusion',
      name: 'illusion',
      desc: '',
      args: [],
    );
  }

  /// `Hervorrufung`
  String get evocation {
    return Intl.message(
      'Hervorrufung',
      name: 'evocation',
      desc: '',
      args: [],
    );
  }

  /// `Nekromantie`
  String get necromancy {
    return Intl.message(
      'Nekromantie',
      name: 'necromancy',
      desc: '',
      args: [],
    );
  }

  /// `oder`
  String get or {
    return Intl.message(
      'oder',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `ausgelöst`
  String get trigger {
    return Intl.message(
      'ausgelöst',
      name: 'trigger',
      desc: '',
      args: [],
    );
  }

  /// `gebannt`
  String get dispel {
    return Intl.message(
      'gebannt',
      name: 'dispel',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural,=1{1 Runde} other{{count} Runden}}`
  String round(num count) {
    return Intl.plural(
      count,
      one: '1 Runde',
      other: '$count Runden',
      name: 'round',
      desc: 'String for displaying rounds',
      args: [count],
    );
  }

  /// `Konzentration`
  String get concentration {
    return Intl.message(
      'Konzentration',
      name: 'concentration',
      desc: '',
      args: [],
    );
  }

  /// `{count, plural,=1{1 Aktion} other{{count} Aktionen}}`
  String action(num count) {
    return Intl.plural(
      count,
      one: '1 Aktion',
      other: '$count Aktionen',
      name: 'action',
      desc: 'String for displaying actions',
      args: [count],
    );
  }

  /// `{count, plural,=1{1 Bonusaktion} other{{count} Bonusaktionen}}`
  String bonusAction(num count) {
    return Intl.plural(
      count,
      one: '1 Bonusaktion',
      other: '$count Bonusaktionen',
      name: 'bonusAction',
      desc: 'String for displaying bonusactions',
      args: [count],
    );
  }

  /// `{count, plural,=1{1 Reaktion} other{{count} Reaktionen}}`
  String reaction(num count) {
    return Intl.plural(
      count,
      one: '1 Reaktion',
      other: '$count Reaktionen',
      name: 'reaction',
      desc: 'String for displaying reactions',
      args: [count],
    );
  }

  /// `{count, plural,=1{1 Sekunde} other{{count} Sekunden}}`
  String second(int count) {
    return Intl.plural(
      count,
      one: '1 Sekunde',
      other: '$count Sekunden',
      name: 'second',
      desc: 'String for displaying seconds',
      args: [count],
    );
  }

  /// `{count, plural,=1{1 Minute} other{{count} Minuten}}`
  String minute(num count) {
    return Intl.plural(
      count,
      one: '1 Minute',
      other: '$count Minuten',
      name: 'minute',
      desc: 'String for displaying minutes',
      args: [count],
    );
  }

  /// `{count, plural,=1{1 Stunde} other{{count} Stunden}}`
  String hour(num count) {
    return Intl.plural(
      count,
      one: '1 Stunde',
      other: '$count Stunden',
      name: 'hour',
      desc: 'String for displaying hours',
      args: [count],
    );
  }

  /// `Unbekannt`
  String get unknown {
    return Intl.message(
      'Unbekannt',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `{cond, select, blinded {Blind} charmed {Bezaubert} deafened {Taub} frightened {Verängstigt} grappled {Gepackt} incapacitated {Kampfunfähig} invisible {Unsichtbar} paralyzed {Gelähmt} petrified {Versteinert} poisoned {Vergiftet} prone {Liegend} restrained {Festgesetzt} stunned {Betäubt} unconscious {Bewusstlos} exhaustion {Erschöpft} other {Fehler}}`
  String condition(String cond) {
    return Intl.select(
      cond,
      {
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
      },
      name: 'condition',
      desc: 'translations of conditions',
      args: [cond],
    );
  }

  /// `Abbrechen`
  String get uiCancel {
    return Intl.message(
      'Abbrechen',
      name: 'uiCancel',
      desc: '',
      args: [],
    );
  }

  /// `Fertig`
  String get uiDone {
    return Intl.message(
      'Fertig',
      name: 'uiDone',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get uiOK {
    return Intl.message(
      'Ok',
      name: 'uiOK',
      desc: '',
      args: [],
    );
  }

  /// `Zauberliste`
  String get mainScreenSpellList {
    return Intl.message(
      'Zauberliste',
      name: 'mainScreenSpellList',
      desc: '',
      args: [],
    );
  }

  /// `Einstellungen`
  String get mainScreenSettings {
    return Intl.message(
      'Einstellungen',
      name: 'mainScreenSettings',
      desc: '',
      args: [],
    );
  }

  /// `Charaktere`
  String get mainScreenSpellBooks {
    return Intl.message(
      'Charaktere',
      name: 'mainScreenSpellBooks',
      desc: '',
      args: [],
    );
  }

  /// `Zauber suchen`
  String get searchSpells {
    return Intl.message(
      'Zauber suchen',
      name: 'searchSpells',
      desc: '',
      args: [],
    );
  }

  /// `Charakter suchen`
  String get spellBookSearchCharacter {
    return Intl.message(
      'Charakter suchen',
      name: 'spellBookSearchCharacter',
      desc: '',
      args: [],
    );
  }

  /// `{amount} Zauber`
  String spellBookSpellCount(num amount) {
    final NumberFormat amountNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String amountString = amountNumberFormat.format(amount);

    return Intl.message(
      '$amountString Zauber',
      name: 'spellBookSpellCount',
      desc: 'String for displaying number of spells',
      args: [amountString],
    );
  }

  /// `Charakter hinzufügen`
  String get characterAddTitle {
    return Intl.message(
      'Charakter hinzufügen',
      name: 'characterAddTitle',
      desc: '',
      args: [],
    );
  }

  /// `Charakter editieren`
  String get characterEditTitle {
    return Intl.message(
      'Charakter editieren',
      name: 'characterEditTitle',
      desc: '',
      args: [],
    );
  }

  /// `Charakter Name`
  String get characterName {
    return Intl.message(
      'Charakter Name',
      name: 'characterName',
      desc: '',
      args: [],
    );
  }

  /// `Klasse des Charakters`
  String get characterClass {
    return Intl.message(
      'Klasse des Charakters',
      name: 'characterClass',
      desc: '',
      args: [],
    );
  }

  /// `Charakter löschen`
  String get characterDeleteTitle {
    return Intl.message(
      'Charakter löschen',
      name: 'characterDeleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sind Sie sich sicher, dass Sie den Charakter {name} löschen wollen?\nDies kann nicht rückgängig gemacht werden.`
  String characterDeleteMessage(Object name) {
    return Intl.message(
      'Sind Sie sich sicher, dass Sie den Charakter $name löschen wollen?\nDies kann nicht rückgängig gemacht werden.',
      name: 'characterDeleteMessage',
      desc: '',
      args: [name],
    );
  }

  /// `Löschen`
  String get characterDeleteOk {
    return Intl.message(
      'Löschen',
      name: 'characterDeleteOk',
      desc: '',
      args: [],
    );
  }

  /// `Es sind noch keine Zauber vorhanden. Verwenden Sie den Knopf in den Einstellungen, um Zauber zu importieren.`
  String get characterNoSpells {
    return Intl.message(
      'Es sind noch keine Zauber vorhanden. Verwenden Sie den Knopf in den Einstellungen, um Zauber zu importieren.',
      name: 'characterNoSpells',
      desc: '',
      args: [],
    );
  }

  /// `Klassen`
  String get spellDetailClasses {
    return Intl.message(
      'Klassen',
      name: 'spellDetailClasses',
      desc: '',
      args: [],
    );
  }

  /// `Seite`
  String get spellDetailPage {
    return Intl.message(
      'Seite',
      name: 'spellDetailPage',
      desc: '',
      args: [],
    );
  }

  /// `Zeitaufwand`
  String get spellDetailCastTime {
    return Intl.message(
      'Zeitaufwand',
      name: 'spellDetailCastTime',
      desc: '',
      args: [],
    );
  }

  /// `Reichweite`
  String get spellDetailDistance {
    return Intl.message(
      'Reichweite',
      name: 'spellDetailDistance',
      desc: '',
      args: [],
    );
  }

  /// `Komponenten`
  String get spellDetailComponents {
    return Intl.message(
      'Komponenten',
      name: 'spellDetailComponents',
      desc: '',
      args: [],
    );
  }

  /// `Wirkungsdauer`
  String get spellDetailDuration {
    return Intl.message(
      'Wirkungsdauer',
      name: 'spellDetailDuration',
      desc: '',
      args: [],
    );
  }

  /// `bis der Zauber {condition} wird `
  String spellDetailDurationPermanent(String condition) {
    return Intl.message(
      'bis der Zauber $condition wird ',
      name: 'spellDetailDurationPermanent',
      desc: 'String for displaying permanent spells',
      args: [condition],
    );
  }

  /// `{numberDice}W{typeDie}`
  String spellDetailDice(int numberDice, int typeDie) {
    final NumberFormat numberDiceNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String numberDiceString = numberDiceNumberFormat.format(numberDice);

    final NumberFormat typeDieNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String typeDieString = typeDieNumberFormat.format(typeDie);

    return Intl.message(
      '${numberDiceString}W$typeDieString',
      name: 'spellDetailDice',
      desc: 'String for displaying dice',
      args: [numberDiceString, typeDieString],
    );
  }

  /// `W{typeDie}`
  String spellDetailDie(int typeDie) {
    final NumberFormat typeDieNumberFormat = NumberFormat.compact(
      locale: Intl.getCurrentLocale(),
    );
    final String typeDieString = typeDieNumberFormat.format(typeDie);

    return Intl.message(
      'W$typeDieString',
      name: 'spellDetailDie',
      desc: 'String for displaying single die',
      args: [typeDieString],
    );
  }

  /// `Zum Charakter hinzufügen`
  String get spellDetailAddSpellTitle {
    return Intl.message(
      'Zum Charakter hinzufügen',
      name: 'spellDetailAddSpellTitle',
      desc: '',
      args: [],
    );
  }

  /// `Keine Charaktere vorhanden. Erstelle einen Charakter, dem du etwas hinzufügen willst.`
  String get spellDetailAddSpellNoChars {
    return Intl.message(
      'Keine Charaktere vorhanden. Erstelle einen Charakter, dem du etwas hinzufügen willst.',
      name: 'spellDetailAddSpellNoChars',
      desc: '',
      args: [],
    );
  }

  /// `Von Charakter entfernen`
  String get spellDetailRemoveFromCharTitle {
    return Intl.message(
      'Von Charakter entfernen',
      name: 'spellDetailRemoveFromCharTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sind sie sicher, dass ***{name}*** von Charakter ***{charname}*** entfernt werden soll?`
  String spellDetailRemoveFromCharMessage(String name, String charname) {
    return Intl.message(
      'Sind sie sicher, dass ***$name*** von Charakter ***$charname*** entfernt werden soll?',
      name: 'spellDetailRemoveFromCharMessage',
      desc: 'String for displaying single die',
      args: [name, charname],
    );
  }

  /// `Entfernen`
  String get spellDetailRemoveFromCharAffirmative {
    return Intl.message(
      'Entfernen',
      name: 'spellDetailRemoveFromCharAffirmative',
      desc: '',
      args: [],
    );
  }

  /// `Zauber löschen`
  String get spellDetailDeleteTitle {
    return Intl.message(
      'Zauber löschen',
      name: 'spellDetailDeleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sind Sie sich sicher, dass Sie den Zauber ***{name}*** löschen wollen?\nDies kann nicht rückgängig gemacht werden.`
  String spellDetailDeleteMessage(Object name) {
    return Intl.message(
      'Sind Sie sich sicher, dass Sie den Zauber ***$name*** löschen wollen?\nDies kann nicht rückgängig gemacht werden.',
      name: 'spellDetailDeleteMessage',
      desc: '',
      args: [name],
    );
  }

  /// `Alle abwählen`
  String get filterUnselect {
    return Intl.message(
      'Alle abwählen',
      name: 'filterUnselect',
      desc: '',
      args: [],
    );
  }

  /// `Zauber filtern`
  String get filterSpells {
    return Intl.message(
      'Zauber filtern',
      name: 'filterSpells',
      desc: '',
      args: [],
    );
  }

  /// `Filter zurücksetzen`
  String get filterReset {
    return Intl.message(
      'Filter zurücksetzen',
      name: 'filterReset',
      desc: '',
      args: [],
    );
  }

  /// `Auf höheren Graden`
  String get onHigherLevels {
    return Intl.message(
      'Auf höheren Graden',
      name: 'onHigherLevels',
      desc: '',
      args: [],
    );
  }

  /// `Sprache`
  String get settingsLanguage {
    return Intl.message(
      'Sprache',
      name: 'settingsLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Sprache auswählen`
  String get settingsLanguageLabel {
    return Intl.message(
      'Sprache auswählen',
      name: 'settingsLanguageLabel',
      desc: '',
      args: [],
    );
  }

  /// `{lang, select, en {Englisch} de {Deutsch} other {Fehler}}`
  String settingsLanguages(String lang) {
    return Intl.select(
      lang,
      {
        'en': 'Englisch',
        'de': 'Deutsch',
        'other': 'Fehler',
      },
      name: 'settingsLanguages',
      desc: 'translations of languages with their languagecode',
      args: [lang],
    );
  }

  /// `Die Sprache wirkt sich nur auf das Interface aus`
  String get settingsLanguageDescription {
    return Intl.message(
      'Die Sprache wirkt sich nur auf das Interface aus',
      name: 'settingsLanguageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Einheit auswählen`
  String get settingsDistanceType {
    return Intl.message(
      'Einheit auswählen',
      name: 'settingsDistanceType',
      desc: '',
      args: [],
    );
  }

  /// `Daten Optionen`
  String get settingsData {
    return Intl.message(
      'Daten Optionen',
      name: 'settingsData',
      desc: '',
      args: [],
    );
  }

  /// `5eTools Zauber importieren`
  String get settingsImport5e {
    return Intl.message(
      '5eTools Zauber importieren',
      name: 'settingsImport5e',
      desc: '',
      args: [],
    );
  }

  /// `App-Daten importieren`
  String get settingsImportData {
    return Intl.message(
      'App-Daten importieren',
      name: 'settingsImportData',
      desc: '',
      args: [],
    );
  }

  /// `App-Daten exportieren`
  String get settingsExportData {
    return Intl.message(
      'App-Daten exportieren',
      name: 'settingsExportData',
      desc: '',
      args: [],
    );
  }

  /// `App-Daten löschen`
  String get settingsDeleteData {
    return Intl.message(
      'App-Daten löschen',
      name: 'settingsDeleteData',
      desc: '',
      args: [],
    );
  }

  /// `App-Version`
  String get settingsAppVersionLabel {
    return Intl.message(
      'App-Version',
      name: 'settingsAppVersionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Diese Nachricht nicht erneut anzeigen`
  String get settingsDoNotShowMessageAgain {
    return Intl.message(
      'Diese Nachricht nicht erneut anzeigen',
      name: 'settingsDoNotShowMessageAgain',
      desc: '',
      args: [],
    );
  }

  /// `Dieser Import ist nur für json-Dateien von 5e-Tools gedacht und nicht für einen Import von Daten dieser App.`
  String get settings5eMessage {
    return Intl.message(
      'Dieser Import ist nur für json-Dateien von 5e-Tools gedacht und nicht für einen Import von Daten dieser App.',
      name: 'settings5eMessage',
      desc: '',
      args: [],
    );
  }

  /// `Dieser Import ist nur für die Daten dieser App gedacht und nicht für Daten von 5e-Tools.\nDer Import wird eventuell Daten überschreiben.`
  String get settingsAppMessage {
    return Intl.message(
      'Dieser Import ist nur für die Daten dieser App gedacht und nicht für Daten von 5e-Tools.\nDer Import wird eventuell Daten überschreiben.',
      name: 'settingsAppMessage',
      desc: '',
      args: [],
    );
  }

  /// `Achtung: Das Löschen kann nicht rückgängig gemacht werden.`
  String get settingsDeleteMessage {
    return Intl.message(
      'Achtung: Das Löschen kann nicht rückgängig gemacht werden.',
      name: 'settingsDeleteMessage',
      desc: '',
      args: [],
    );
  }

  /// `Daten erfolgreich exportiert`
  String get settingsExportMessage {
    return Intl.message(
      'Daten erfolgreich exportiert',
      name: 'settingsExportMessage',
      desc: '',
      args: [],
    );
  }

  /// `Fehler: Export nicht möglich`
  String get settingsExportMessageFail {
    return Intl.message(
      'Fehler: Export nicht möglich',
      name: 'settingsExportMessageFail',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
