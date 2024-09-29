import 'package:dnd_beyonder/data/gui/sorting.dart';
import 'package:dnd_beyonder/data/spell/spellFilter.dart';
import 'package:dnd_beyonder/gui/Screens/spellFilterScreen.dart';
import 'package:dnd_beyonder/gui/Screens/spellDetailScreen.dart';
import 'package:dnd_beyonder/gui/Widgets/SpellList/spellListWidget.dart';
import 'package:flutter/material.dart';

import '../../data/spell/spell.dart';

class SpellListScreen extends StatefulWidget {
  final List<Spell> spells;


  const SpellListScreen(this.spells,{super.key});
  @override
  State<SpellListScreen> createState() => _SpellListScreenState();
}

class _SpellListScreenState extends State<SpellListScreen> {
  static int _selectedSpell = -1;
  static bool _filter = false;
  static String _searchText = "";
  static final SpellFilter _spellFilter = SpellFilter();
  static bool _asc = true;
  static Sorting _sorting = Sorting.name;

  void _onItemTapped(int index) {
    setState(() {
      _selectedSpell = index;
    });
  }

  void _onSearchText(String text) {
    setState(() {
      _searchText = text;
    });
  }

  void _showFilterScreen(bool show) {
    setState(() {
      _filter = show;
    });
  }

  void _resetFilter() {
    setState(() {
      _spellFilter.reset();
      _filter = false;
    });
  }

  void _updateSorting(Sorting sort, bool asc){
    setState(() {
      _asc = asc;
      _sorting = sort;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedSpell >= 0) {
      return SpellDetailScreen(widget.spells[_selectedSpell], _onItemTapped);
    }
    if (_filter) {
      return SpellFilterScreen(_showFilterScreen, _resetFilter,_spellFilter);
    }
    return SpellListWidget(
        spells: widget.spells,
        spellFilter: _spellFilter,
        searchText: _searchText,
        onItemTapped: _onItemTapped,
        updateSorting: _updateSorting,
        showFilterScreen: _showFilterScreen,
        onSearchText: _onSearchText,
        sorting: _sorting,
        asc: _asc);
  }
}
