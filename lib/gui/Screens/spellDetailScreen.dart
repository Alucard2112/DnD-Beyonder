import 'package:tavern_tome/data/gui/constants.dart';
import 'package:tavern_tome/data/spell/distanceType.dart';
import 'package:tavern_tome/data/spell/sourceBook.dart';
import 'package:tavern_tome/data/spell/spell.dart';
import 'package:tavern_tome/data/spell/subclass.dart';
import 'package:tavern_tome/gui/General/entryWidget.dart';
import 'package:tavern_tome/gui/Screens/spellListScreen.dart';
import 'package:tavern_tome/gui/Widgets/Spell/addSpellToCharacterDialog.dart';
import 'package:tavern_tome/gui/Widgets/Spell/deleteSpellDialog.dart';
import 'package:tavern_tome/gui/Widgets/Spell/spellDescriptionWidget.dart';
import 'package:tavern_tome/gui/Widgets/clickableIcon.dart';
import 'package:tavern_tome/permanentData/boxHandler.dart';
import 'package:flutter/material.dart';

import '../../data/character/character.dart';
import '../../data/dnd/dnd_class.dart';
import '../../data/spell/spellSchool.dart';
import '../../generated/l10n.dart';
import '../../permanentData/settings.dart';

class SpellDetailScreen extends StatelessWidget {
  final Spell spell;
  final Function function;
  final Function update;
  final Character? character;
  const SpellDetailScreen({super.key, required this.update, required this.spell, required this.function, this.character});

  //TODO verbrauchbare Materialien kennzeichnen

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
      children.add(Text("(${subClasses.getName(Settings.locale!)})", style: normalText.copyWith(color: subheadingColor),));
    }
    List<Widget> sourceWidgets = [];
    sourceWidgets.add(const Icon(Icons.book_outlined, color: subheadingColor,));
    sourceWidgets.add(Container(width: 12,));
    sourceWidgets.add(Text(sourceBookToString(spell.source), style: subheadingText,));
    if(spell.getPage() >= 0) {
      sourceWidgets.add(const Text(", ", style: subheadingText,));
      sourceWidgets.add(Text("${S.of(context).spellDetailPage} ${spell.getPage()}", style: subheadingText,));
    }
    ClickableIcon iconWidget = ClickableIcon(
      onTap: (){
        AddSpellToCharactersDialog(
          spell: spell,
          update: update,
        ).openDialog(context);},
      icon: Icons.bookmark_add_outlined,
    );
    Widget deleteSpellWidget = ClickableIcon(
        onTap: () async{
          bool decision = await DeleteSpellDialog(
            spell: spell,
          ).openDialog(context);
          if(decision){
            BoxHandler.spellBox.delete(spell.id);
            for(Character character in BoxHandler.characterBox.values){
              int index = character.spellIds.indexOf(spell.id);
              if(index >= 0){
                if(SpellListScreen.selectedSpell[character.id] != null && SpellListScreen.selectedSpell[character.id]! > index) {
                  SpellListScreen.selectedSpell[character.id] = SpellListScreen.selectedSpell[character.id]! - 1;
                }
                else if(SpellListScreen.selectedSpell[character.id] == index) {
                  SpellListScreen.selectedSpell[character.id] = -1;
                }
                character.spellIds.remove(spell.id);
                character.save();
              }
            }
            update();
            function(-1);
          }
        },
        icon: Icons.delete,
    );
    Widget spacer = const SizedBox(width: 20,);
    if(character != null){
      spacer = Container();
      deleteSpellWidget = Container();
      iconWidget = ClickableIcon(
        icon: Icons.bookmark_remove,
        onTap: () async{
            bool decision = await DeleteSpellDialog(
              spell: spell,
            ).openDialog(context);
            if(decision){
              character!.spellIds.remove(spell.id);
              character!.save();
              update();
              function(-1);
            }
          },
      );
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
                        child: Icon(Icons.arrow_back_outlined, color: textColor,),
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
                      Text(spell.getName(), style: boldNormalText,),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                iconWidget,
                spacer,
                deleteSpellWidget,
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
                    EntryWidget(
                        "${S.of(context).spellDetailCastTime}: ",
                        spell.time.toString(),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    EntryWidget(
                        "${S.of(context).spellDetailDistance}: ",
                        Settings.distanceType! == DistanceType.meters ? spell.range.inMeters() : spell.range.inFeet(),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                    Wrap(
                      children: [
                        Text("${S.of(context).spellDetailComponents}: ", style: boldNormalText,),
                        Text(spell.components.toString(), style: normalText,),
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
                    SpellDescriptionWidget(spell.getEntries(), spell.getEntriesHigherLevel()),
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
