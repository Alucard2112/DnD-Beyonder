import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:flutter/material.dart';

class CharacterSpellListScreen extends StatefulWidget {
  final List<Spell> spells;
  const CharacterSpellListScreen({required this.spells, super.key});

  @override
  State<CharacterSpellListScreen> createState() => _CharacterSpellListScreenState();
}

class _CharacterSpellListScreenState extends State<CharacterSpellListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
