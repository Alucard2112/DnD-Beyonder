import 'package:dnd_beyonder/data/sortable.dart';
import 'package:dnd_beyonder/data/character/character.dart';
import 'package:dnd_beyonder/gui/Screens/characterDetailScreen.dart';
import 'package:dnd_beyonder/gui/Widgets/Character/characterWidget.dart';
import 'package:dnd_beyonder/gui/Widgets/clickableIcon.dart';

import 'package:flutter/material.dart';
import '../../data/gui/constants.dart';
import '../../data/gui/sorting.dart';
import '../../generated/l10n.dart';
import '../Widgets/SearchBarWidget.dart';
import '../Widgets/sortUiButtonWidget.dart';

class CharacterListScreen extends StatefulWidget {
  final List<Character> characters;
  const CharacterListScreen({required this.characters, super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  static bool _asc = true;
  static Sorting _sorting = Sorting.name;
  static String _searchText = "";
  static int _selectedCharacter = -1;

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

  @override
  Widget build(BuildContext context) {
    Widget child;
    if(_selectedCharacter >= 0){
      child = CharacterDetailScreen(
        character: widget.characters[_selectedCharacter],
        back: _back,
      );
    }
    else {
      List<CharacterWidget> children = [];
      for (int i = 0; i < widget.characters.length; i++) {
        Character book = widget.characters[i];
        if (book.name.toLowerCase().contains(_searchText.toLowerCase())) {
          children.add(CharacterWidget(spellBook: book, onTap: () {
            _onSelect(i);
          },));
        }
      }
      String badgeText = "";
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
                    InkWell(
                      onTap: (){},//TODO
                      child: const Icon(Icons.add_circle, color: iconColorPurple,size: 30,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 8),
                      child: ClickableIcon(badgeText: badgeText,onTap: (){}, icon: Icons.filter_list_alt),
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
