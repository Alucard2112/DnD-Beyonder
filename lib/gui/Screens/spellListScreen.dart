import 'package:dnd_beyonder/data/gui/sorting.dart';
import 'package:dnd_beyonder/data/spell/spellFilter.dart';
import 'package:dnd_beyonder/gui/Screens/filterScreen.dart';
import 'package:dnd_beyonder/gui/Screens/spellDetailScreen.dart';
import 'package:dnd_beyonder/gui/Widgets/SpellList/spellListWidget.dart';
import 'package:flutter/material.dart';

import '../../data/character/character.dart';
import '../../data/spell/spell.dart';

class SpellListScreen extends StatefulWidget {
  final List<Spell> spells;
  final Function update;
  final Character? character;
  const SpellListScreen({super.key, required this.update, required this.spells, this.character});
  @override
  State<SpellListScreen> createState() => _SpellListScreenState();
}

class _SpellListScreenState extends State<SpellListScreen> {
  static final Map<int, int> _selectedSpell = {};
  static final Map<int, bool>_filter = {};
  static final Map<int, String> _searchText = {};
  static final Map<int,SpellFilter> _spellFilter = {};
  static final Map<int, bool> _asc = {};
  static final Map<int,Sorting> _sorting = {};
  late final int key;

  @override
  void initState() {
    key = widget.character?.id ?? -1;
    if(!_selectedSpell.containsKey(key)){
      _selectedSpell[key] = -1;
    }
    if(!_filter.containsKey(key)){
      _filter[key] = false;
    }
    if(!_searchText.containsKey(key)){
      _searchText[key] = "";
    }
    if(!_spellFilter.containsKey(key)){
      if(key >= 0){
        _spellFilter[key] = SpellFilter.character();
      }
      else{
        _spellFilter[key] = SpellFilter();
      }
    }
    if(!_asc.containsKey(key)){
      _asc[key] = true;
    }
    if(!_sorting.containsKey(key)){
      _sorting[key] = Sorting.name;
    }
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedSpell[key] = index;
    });
  }

  void _onSearchText(String text) {
    setState(() {
      _searchText[key] = text;
    });
  }

  void _showFilterScreen(bool show) {
    setState(() {
      _filter[key] = show;
    });
  }

  void _resetFilter() {
    setState(() {
      _spellFilter[key]!.reset();
      _filter[key] = false;
    });
  }

  void _updateSorting(Sorting sort, bool asc){
    setState(() {
      _asc[key] = asc;
      _sorting[key] = sort;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedSpell[key]! >= 0) {
      return SpellDetailScreen(
        spell: widget.spells[_selectedSpell[key]!],
        function: _onItemTapped,
        update: widget.update,
        character: widget.character,
      );
    }
    if (_filter[key]!) {
      return FilterScreen(
          _showFilterScreen,
          _resetFilter,
          _spellFilter[key]!,
        stateKey: widget.character?.id ?? -1,
      );
    }
    return SpellListWidget(
        spells: widget.spells,
        spellFilter: _spellFilter[key]!,
        searchText: _searchText[key]!,
        onItemTapped: _onItemTapped,
        updateSorting: _updateSorting,
        showFilterScreen: _showFilterScreen,
        onSearchText: _onSearchText,
        sorting: _sorting[key]!,
        asc: _asc[key]!);
  }
}
