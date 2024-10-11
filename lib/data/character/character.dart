import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/permanentData/boxHandler.dart';
import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 8)
class Character extends HiveObject{
  @HiveField(0)
  final DnDClass dnDClass;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<int> spellIds;
  @HiveField(3)
  final int id;

  static int maxId = 0;

  final List<Spell> spells = [];

  Character({required this.id, required this.dnDClass, required this.name, required this.spellIds}){
   if(id>maxId){
     maxId = id;
   }
    for(int i in spellIds){
     spells.add(BoxHandler.spellBox.get(i)!);
   }
  }
}