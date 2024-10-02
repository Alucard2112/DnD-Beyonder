import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/data/spell/sourceBook.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/data/spell/subclass.dart';
import 'package:dnd_beyonder/gui/General/entryWidget.dart';
import 'package:dnd_beyonder/gui/Widgets/Spell/spellDescriptionWidget.dart';
import 'package:flutter/material.dart';

import '../../data/dnd/dnd_class.dart';
import '../../data/spell/spellSchool.dart';
import '../../generated/l10n.dart';

class SpellDetailScreen extends StatelessWidget {
  final Spell spell;
  final Function function;

  const SpellDetailScreen(this.spell, this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(Text("${S.of(context).spellDetailClasses}: ", style: boldNormalText,));
    for(int i = 0; i < spell.mainClasses.length; i++){
      DnDClass classes = spell.mainClasses.elementAt(i);
      String classString = toDnDClassName(classes);
      if(i < spell.mainClasses.length-1){
        classString+=", ";
      }
      children.add(Text(classString, style: normalText,));
    }
    for(SubClasses subClasses in spell.subClasses){
      children.add(const Text(", ", style: normalText,));
      children.add(Text(toDnDClassName(subClasses.c), style: normalText,));
      children.add(const Text(" ", style: normalText,));
      children.add(Text("(${subClasses.name})", style: normalText.copyWith(color: subheadingColor),));
    }
    List<Widget> sourceWidgets = [];
    sourceWidgets.add(const Icon(Icons.book_outlined, color: subheadingColor,));
    sourceWidgets.add(Container(width: 12,));
    sourceWidgets.add(Text(sourceBookToString(spell.source), style: subheadingText,));
    if(spell.page >= 0) {
      sourceWidgets.add(const Text(", ", style: subheadingText,));
      sourceWidgets.add(Text("${S.of(context).spellDetailPage} ${spell.page}", style: subheadingText,));
    }
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:(bool didPop, Object? result) async {
        if(didPop){
          return;
        }
        function(-1);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    function(-1);
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 20,
                        child: Icon(Icons.arrow_back_ios_rounded, color: textColor,),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                      SizedBox(
                        height: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/spell_schools/${getIconNameFromSchool(spell.school)}.png',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                      Text(spell.name, style: boldNormalText,),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                InkWell(
                  onTap: (){ //TODO zum Zauberbuch hinzufügen

                  },
                  child: Transform.scale(
                    scale: 1.2,
                    child: const Icon(
                      Icons.bookmark_add_outlined,
                      color: iconColorPurple,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 12,
            ),
            Expanded(
              child: ListView(
                  children: [

                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Text(spell.getSchoolLevelForUI(), style: normalText,),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    const Divider(
                      color: iconColorPurple,
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    EntryWidget("${S.of(context).spellDetailCastTime}: ", spell.time.toString()),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    EntryWidget("${S.of(context).spellDetailDistance}: ", spell.range.inMeters()),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    Wrap(
                      children: [
                        Text("${S.of(context).spellDetailComponents}: ", style: boldNormalText,),
                        Text(spell.components.toString(),style: normalText,),
                        Text(spell.components.material(), style: subheadingText,)
                      ],
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    EntryWidget("${S.of(context).spellDetailDuration}: ", spell.duration.toString()),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    const Divider(
                      color: iconColorPurple,
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    SpellDescriptionWidget(spell.entries, spell.entriesHigherLevel),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    const Divider(
                      color: iconColorPurple,
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    Wrap(
                      children: children,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: searchBarLabelColor),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: IntrinsicWidth(
                        child: Wrap(
                          children: sourceWidgets,
                        ),
                      ),
                    )
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
