import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/data/spell/entryHigherLevel.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class SpellDescriptionWidget extends StatelessWidget {
  final List<String> description;
  final List<EntryHigherLevel> atHigherLevels;
  const SpellDescriptionWidget(this.description, this.atHigherLevels,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: makeChildren(),
    );
  }

  List<Widget> makeChildren(){
    List<Widget> children = [];
    for(String s in description){
      children.add(
          Text(s, style: normalText)
      );
    }
    if(atHigherLevels.isNotEmpty){
      children.add(
          const Padding(padding: EdgeInsets.symmetric(vertical: 6))
      );
      children.add(
          Text(S.current.onHigherLevels, style: boldNormalText,)
      );
      for(EntryHigherLevel e in atHigherLevels){
        for(String s in e.entries) {
          children.add(
              Text(s, style: normalText)
          );
        }
      }
    }
    return children;
  }
}
