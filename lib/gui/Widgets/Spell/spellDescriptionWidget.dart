import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/data/spell/entryHigherLevel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
    for(int i = 0; i <description.length;i++){
      String s = description[i];
      children.add(
          Container(
            margin: EdgeInsets.only(bottom: i < description.length -1 ? 10: 0,),
            child: MarkdownBody(
                data: s,
                styleSheet: markDownStyle,
            ),
          )
      );
    }
    if(atHigherLevels.isNotEmpty){
      children.add(
          const Padding(padding: EdgeInsets.symmetric(vertical: 12))
      );
      children.add(
          Text(
            S.current.onHigherLevels,
            style: boldNormalText,)
      );
      for(EntryHigherLevel e in atHigherLevels){
        for(String s in e.entries) {
          children.add(
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: MarkdownBody(
                  data: s,
                  styleSheet: markDownStyle,
                ),
              )
          );
        }
      }
    }
    return children;
  }
}
