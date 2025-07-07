import 'package:tavern_tome/converters/fiveEToolsConverter.dart';
import 'package:tavern_tome/data/gui/constants.dart';
import 'package:tavern_tome/data/spell/entryHigherLevel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../generated/l10n.dart';

class SpellDescriptionWidget extends StatelessWidget {
  final List<String> description;
  final List<EntryHigherLevel> atHigherLevels;
  const SpellDescriptionWidget(this.description, this.atHigherLevels,{super.key});

  Widget _renderMarkdown(String s){
    if(s.contains("| ----------- | ----------- |")){
      int first = s.indexOf("|");
      String header = s.substring(0,first).replaceAll("\n", "");
      String content = s.substring(first);
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MarkdownBody(
              data: FiveEToolsConverter.translateAnnotations(header),
              styleSheet: markDownStyle,
            ),
            const SizedBox(
              height: 2,
            ),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: MarkdownBody(
                data: FiveEToolsConverter.translateAnnotations(content),
                styleSheet: markDownStyle,
              ),
                ),
          ],
        ),
      );
    }
    return Container(
          margin: const EdgeInsets.only(top: 10),
          child: MarkdownBody(
            data: FiveEToolsConverter.translateAnnotations(s),
            styleSheet: markDownStyle,
          ),
        );
  }

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
      children.add(_renderMarkdown(s));
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
          children.add(_renderMarkdown(s));
        }
      }
    }
    return children;
  }
}
