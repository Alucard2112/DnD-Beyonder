import 'package:dnd_beyonder/data/sortable.dart';
import 'package:dnd_beyonder/data/spellbook/spellbook.dart';
import 'package:dnd_beyonder/gui/Screens/spellBookDetailScreen.dart';
import 'package:dnd_beyonder/gui/Widgets/SpellBook/spellBookWidget.dart';
import 'package:dnd_beyonder/gui/Widgets/clickableIcon.dart';

import 'package:flutter/material.dart';
import 'package:hero_animation/hero_animation.dart';
import '../../data/gui/constants.dart';
import '../../data/gui/sorting.dart';
import '../Widgets/SearchBarWidget.dart';
import '../Widgets/sortUiButtonWidget.dart';

class SpellBookListScreen extends StatefulWidget {
  final List<SpellBook> books;
  const SpellBookListScreen({required this.books, super.key});

  @override
  State<SpellBookListScreen> createState() => _SpellBookListScreenState();
}

class _SpellBookListScreenState extends State<SpellBookListScreen> {
  static bool _asc = true;
  static Sorting _sorting = Sorting.name;
  static String _searchText = "";
  static int _selectedSpellBook = -1;

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
      _selectedSpellBook = -1;
    });
  }

  void _onSelect(int index){
    setState(() {
      _selectedSpellBook = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if(_selectedSpellBook >= 0){
      child = SpellBookDetailScreen(spellBook: widget.books[_selectedSpellBook], back: _back,);
    }
    else {
      List<SpellBookWidget> children = [];
      for (int i = 0; i < widget.books.length; i++) {
        SpellBook book = widget.books[i];
        if (book.name.toLowerCase().contains(_searchText.toLowerCase())) {
          children.add(SpellBookWidget(spellBook: book, onTap: () {
            _onSelect(i);
          },));
        }
      }
      String badgeText = "";
      children.sort((SpellBookWidget a, SpellBookWidget b) {
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
                        hintText: "Charakter suchen",
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
