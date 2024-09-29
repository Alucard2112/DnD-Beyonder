import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/data/spell/spellFilter.dart';
import 'package:dnd_beyonder/gui/Widgets/SpellList/spellListItemWidget.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/sorting.dart';
import '../../../data/sortable.dart';
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
    List<SpellListItemWidget> children = [];
    for (int i = 0; i < spells.length; i++) {
      Spell spell = spells[i];
      if (spellFilter.spellPasses(spell, searchText)) {
        children.add(
            SpellListItemWidget(spell,
                  () {
                onItemTapped(i);
              },
            ));
      }
    }
    children.sort((SpellListItemWidget a, SpellListItemWidget b){
      return Sortable.sortFunction(a, b, sorting, asc);
    });
    String badgeText = spellFilter.getFilterText();
    List<Sorting> values = [];
    values.addAll(Sorting.values);
    values.remove(Sorting.spellCount);
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
                      hintText: "Zauber suchen",
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
          child: ListView(
            children: children,
          ),
        ),
      ],
    );;
  }
}
