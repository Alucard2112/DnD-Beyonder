import 'package:hive/hive.dart';

part 'entryHigherLevel.g.dart';

@HiveType(typeId: 4)
class EntryHigherLevel{
  @HiveField(0)
  final String type;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<String> entries;

  EntryHigherLevel(this.type, this.name, this.entries);

  Map<String, dynamic> toJson() => {
    "type" : type,
    "name" : name,
    "entries" : entries,
  };

  EntryHigherLevel.fromJson(Map<String, dynamic> json)
    : type = json["type"] as String,
      name = json["name"] as String,
      entries = List<String>.from(json["entries"]);
}