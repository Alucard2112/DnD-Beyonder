import 'package:dnd_beyonder/data/character/characterFilter.dart';
import 'package:dnd_beyonder/data/sortable.dart';
import 'package:dnd_beyonder/data/character/character.dart';
import 'package:dnd_beyonder/gui/Screens/characterDetailScreen.dart';
import 'package:dnd_beyonder/gui/Widgets/Character/addCharacterDialog.dart';
import 'package:dnd_beyonder/gui/Widgets/Character/characterWidget.dart';
import 'package:dnd_beyonder/gui/Widgets/clickableIcon.dart';

import 'package:flutter/material.dart';
import '../../data/filter.dart';
import '../../data/gui/sorting.dart';
import '../../generated/l10n.dart';
import '../Widgets/SearchBarWidget.dart';
import '../Widgets/sortUiButtonWidget.dart';
import 'filterScreen.dart';

class CharacterListScreen extends StatefulWidget {
  final List<Character> characters;
  final Function update;
  const CharacterListScreen({required this.characters, super.key, required this.update});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  static bool _asc = true;
  static Sorting _sorting = Sorting.name;
  static String _searchText = "";
  static int _selectedCharacter = -1;
  static Filter _filter = CharacterFilter();
  static bool _showFilter = false;

  void _onSearchText(String text) {
    setState(() {
      _searchText = text;
    });
  }

  void _updateSorting(Sorting sort, bool asc){
    setState(() {
      _asc = asc;
      _sorting = sort;
    });
  }

  void _back(){
    setState(() {
      _selectedCharacter = -1;
    });
  }

  void _onSelect(int index){
    setState(() {
      _selectedCharacter = index;
    });
  }

  void _showFilterScreen(bool show) {
    setState(() {
      _showFilter = show;
    });
  }

  void _resetFilter() {
    setState(() {
      _filter.reset();
      _showFilter = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if(_showFilter){
      return FilterScreen(
        _showFilterScreen,
        _resetFilter,
        _filter,
        stateKey: -2,
      );
    }
    if(_selectedCharacter >= 0){
      child = CharacterDetailScreen(
        character: widget.characters[_selectedCharacter],
        back: _back,
        update: widget.update,
      );
    }
    else {
      List<CharacterWidget> children = [];
      for (int i = 0; i < widget.characters.length; i++) {
        Character character = widget.characters[i];
        if(_filter.objectPasses(character, _searchText)) {
          children.add(CharacterWidget(spellBook: character, onTap: () {
              _onSelect(i);
            },));
          }

      }
      String badgeText = _filter.getFilterText();
      children.sort((CharacterWidget a, CharacterWidget b) {
        return Sortable.sortFunction(a, b, _sorting, _asc);
      });
      child = Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SortUiButtonWidget(
                  sorting: _sorting,
                  asc: _asc,
                  callBack: _updateSorting,
                  values: const [Sorting.name, Sorting.dndClass, Sorting.spellCount],
                ),
                Container(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SearchBarWidget(
                        searchText: _searchText,
                        onChanged: _onSearchText,
                        hintText: S.of(context).spellBookSearchCharacter,
                      ),
                    ),
                    Container(
                      width: 10,
                    ),
                    ClickableIcon(
                      onTap: () async{
                        bool decision = await AddCharacterDialog().openDialog(context);
                        if(decision){
                          widget.update();
                        }
                      },
                      icon: Icons.add_circle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 8),
                      child: ClickableIcon(
                          badgeText: badgeText,
                          onTap: (){
                            _showFilterScreen(true);
                          },
                          icon: Icons.filter_list_alt),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
                children: children,
              ),
          )
        ],
      );
    }
    return child;
  }
}
