import 'dart:math';

import 'package:tavern_tome/data/spell/spell.dart';
import 'package:tavern_tome/data/spell/spellFilter.dart';
import 'package:tavern_tome/gui/Widgets/SpellList/spellListItemWidget.dart';
import 'package:tavern_tome/gui/multiItemListView.dart';
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
  final int id;
  final bool asc;
  const SpellListWidget({super.key, required this.spells, required this.spellFilter, required this.searchText, required this.onItemTapped, required this.updateSorting, required this.showFilterScreen, required this.onSearchText, required this.sorting, required this.asc, required this.id});

  @override
  Widget build(BuildContext context) {
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
          child: MultiItemListView<Spell>(
              data: spells,
              createWidget: (Spell spell){
                return SpellListItemWidget(
                    spell,
                        () {
                      onItemTapped(spell.id);
                    }
                );
              },
            screenName: 'Spells',
            id: id,
          ),
        ),
      ],
    );
  }
}
