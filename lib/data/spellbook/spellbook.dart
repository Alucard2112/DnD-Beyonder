import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/permanentData/boxHandler.dart';
import 'package:hive/hive.dart';

part 'spellbook.g.dart';

@HiveType(typeId: 8)
class SpellBook{
  @HiveField(0)
  final DnDClass dnDClass;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<int> spellIds;
  @HiveField(3)
  final int id;

  final List<Spell> spells = [];

  SpellBook({required this.id, required this.dnDClass, required this.name, required this.spellIds}){
   for(int i in spellIds){
     spells.add(BoxHandler.spellBox.get(i)!);
   }
  }
}