import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';

class SpellBook{
  final DnDClass dnDClass;
  final String name;
  final List<Spell> spells;
  final int id;

  SpellBook({required this.id, required this.dnDClass, required this.name, required this.spells});
}