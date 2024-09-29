import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:flutter/material.dart';

class SpellBookSpellListScreen extends StatefulWidget {
  final List<Spell> spells;
  const SpellBookSpellListScreen({required this.spells, super.key});

  @override
  State<SpellBookSpellListScreen> createState() => _SpellBookSpellListScreenState();
}

class _SpellBookSpellListScreenState extends State<SpellBookSpellListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
