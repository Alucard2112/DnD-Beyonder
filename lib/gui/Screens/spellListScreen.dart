import 'package:dnd_beyonder/data/gui/sorting.dart';
import 'package:dnd_beyonder/data/spell/spellFilter.dart';
import 'package:dnd_beyonder/gui/Screens/spellFilterScreen.dart';
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
  static int _selectedSpell = -1;
  static bool _filter = false;
  static String _searchText = "";
  static final SpellFilter _spellFilter = SpellFilter();
  static bool _asc = true;
  static Sorting _sorting = Sorting.name;

  static int _selectedSpell_Character = -1;
  static bool _filter_Character = false;
  static String _searchText_Character = "";
  static final SpellFilter _spellFilter_Character = SpellFilter();
  static bool _asc_Character = true;
  static Sorting _sorting_Character = Sorting.name;

  void _setSelectedSpell(int index){
    if(widget.character!=null){
      _selectedSpell_Character = index;
    }
    else{
      _selectedSpell = index;
    }
  }

  int _getSelectedSpell(){
    if(widget.character!=null){
      return _selectedSpell_Character;
    }
    else{
      return _selectedSpell;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _setSelectedSpell(index);
    });
  }

  void _setSearchText(String text){
    if(widget.character!=null){
      _searchText_Character = text;
    }
    else{
      _searchText = text;
    }
  }

  String _getSearchText(){
    if(widget.character!=null){
      return _searchText_Character;
    }
    else{
      return _searchText;
    }
  }

  void _onSearchText(String text) {
    setState(() {
      _setSearchText(text);
    });
  }

  void _setFilter(bool show){
    if(widget.character!=null){
      _filter_Character = show;
    }
    else{
      _filter = show;
    }
  }

  bool _getFilter(){
    if(widget.character!=null){
      return _filter_Character;
    }
    else{
      return _filter;
    }
  }

  void _showFilterScreen(bool show) {
    setState(() {
      _setFilter(show);
    });
  }

  void _setResetFilter(){
    if(widget.character!=null){
      _spellFilter_Character.reset();
    }
    else{
      _spellFilter.reset();
    }
  }

  _getSpellFilter(){
    if(widget.character!=null){
      return _spellFilter_Character;
    }
    else{
      return _spellFilter;
    }
  }

  void _resetFilter() {
    setState(() {
      _setResetFilter();
      _setFilter(false);
    });
  }

  void _setAsc(bool asc){
    if(widget.character!=null){
      _asc_Character = asc;
    }
    else{
      _asc = asc;
    }
  }

  bool _getAsc(){
    if(widget.character!=null){
      return _asc_Character;
    }
    else{
      return _asc;
    }
  }

  void _setSorting(Sorting sort){
    if(widget.character!=null){
      _sorting_Character = sort;
    }
    else{
      _sorting = sort;
    }
  }

  Sorting _getSorting(){
    if(widget.character!=null){
      return _sorting_Character;
    }
    else{
      return _sorting;
    }
  }

  void _updateSorting(Sorting sort, bool asc){
    setState(() {
      _setAsc(asc);
      _setSorting(sort);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_getSelectedSpell() >= 0) {
      return SpellDetailScreen(
        spell: widget.spells[_getSelectedSpell()],
        function: _onItemTapped,
        update: widget.update,
        character: widget.character,
      );
    }
    if (_getFilter()) {
      return SpellFilterScreen(
          _showFilterScreen,
          _resetFilter,
          _getSpellFilter());
    }
    return SpellListWidget(
        spells: widget.spells,
        spellFilter: _getSpellFilter(),
        searchText: _getSearchText(),
        onItemTapped: _onItemTapped,
        updateSorting: _updateSorting,
        showFilterScreen: _showFilterScreen,
        onSearchText: _onSearchText,
        sorting: _getSorting(),
        asc: _getAsc());
  }
}
