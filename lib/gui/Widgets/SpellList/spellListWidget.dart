import 'dart:math';

import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/data/spell/spellFilter.dart';
import 'package:dnd_beyonder/gui/Widgets/SpellList/spellListItemWidget.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/sorting.dart';
import '../../../generated/l10n.dart';
import '../SearchBarWidget.dart';
import '../clickableIcon.dart';
import '../sortUiButtonWidget.dart';

class SpellListWidget extends StatelessWidget {
  final List<Spell> spells;
  final SpellFilter spellFilter;
  final String searchText;
  final Function onItemTapped;
  final Function updateSorting;
  final Function showFilterScreen;
  final ValueChanged<String> onSearchText;
  final Sorting sorting;
  final bool asc;
  const SpellListWidget({super.key, required this.spells, required this.spellFilter, required this.searchText, required this.onItemTapped, required this.updateSorting, required this.showFilterScreen, required this.onSearchText, required this.sorting, required this.asc});

  @override
  Widget build(BuildContext context) {
    String badgeText = spellFilter.getFilterText();
    List<Sorting> values = [];
    values.addAll(Sorting.values);
    values.remove(Sorting.spellCount);
    int gridCount = max((MediaQuery.of(context).size.width / 420).floor(),1);
    int itemCount = (spells.length / gridCount).ceil();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SortUiButtonWidget(
                sorting: sorting,
                asc: asc,
                callBack: updateSorting,
                values: values,
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
                      searchText: searchText,
                      onChanged: onSearchText,
                      hintText: S.of(context).searchSpells,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 8),
                    child: ClickableIcon(
                        badgeText: badgeText,
                        onTap: (){showFilterScreen(true);},
                        icon: Icons.filter_list_alt),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            key: PageStorageKey<String>('spells_$key'),
            itemCount: itemCount,
            itemBuilder: (context, index) {
                List<Widget> children = [];
                for(int i = 0; i < gridCount; i++){
                  int indexGrid = index*gridCount+i;
                  if(indexGrid < spells.length){
                    Spell spell = spells[indexGrid];
                    children.add(
                      Expanded(child:
                        SpellListItemWidget(spell,
                          () {
                            onItemTapped(spell.id);
                          }
                        ),
                      ),
                    );
                  }
                  else{
                    children.add(Expanded(child: Container()));
                  }
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                );
              }
          ),
        ),
      ],
    );
  }
}
