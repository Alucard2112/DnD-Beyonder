import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/permanentData/boxHandler.dart';
import 'package:hive/hive.dart';

part 'character.g.dart';

@HiveType(typeId: 8)
class Character extends HiveObject{
  @HiveField(0)
  DnDClass dnDClass;
  @HiveField(1)
  String name;
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
   _addSpells();
  }

  void _addSpells(){
    List<int> deadIds = [];
    for(int i in spellIds){
      Spell? spell = BoxHandler.spellBox.get(i);
      if(spell == null){
        deadIds.add(i);
      }
      else {
        spells.add(spell);
      }
    }
    for(int i in deadIds){
      spellIds.remove(i);
    }
  }

  Character.fromJson(Map<String, dynamic> json)
    : id = json["id"] as int,
      name = json["name"] as String,
      spellIds = List<int>.from(json["spellIds"]),
      dnDClass = DnDClass.values[json["dnDClass"] as int]
  {
    _addSpells();
  }

  Map<String, dynamic> toJson() => {
    "id" : id,
    "dnDClass" : dnDClass.index,
    "name" : name,
    "spellIds" : spellIds,
  };
}