import 'package:dnd_beyonder/data/character/character.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/permanentData/boxHandler.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/constants.dart';
import '../../../generated/l10n.dart';

class RemoveFromCharacterDialog extends StatefulWidget {
  final Spell spell;
  final Character character;
  final Function update;
  final List<Character> characters = BoxHandler.characterBox.values.toList();
  RemoveFromCharacterDialog({super.key, required this.spell, required this.update, required this.character});

  @override
  State<RemoveFromCharacterDialog> createState() => _RemoveFromCharacterDialogState();

  static Future openDialog(BuildContext context, Spell spell, Character character, Function update) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          scrollable: true,
          title: Text(S.of(context).spellDetailRemoveFromCharTitle, style: headingText,),
          backgroundColor: scaffoldBackgroundColor,
          content: RemoveFromCharacterDialog(
            spell: spell,
            character: character,
            update: update,
          )
      )
  );
}

class _RemoveFromCharacterDialogState extends State<RemoveFromCharacterDialog> {

  @override
  Widget build(BuildContext context) {
      return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).spellDetailRemoveFromCharMessage(widget.spell.name, widget.character.name), style: normalText,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop(false);
                  },
                  child: Text(S.of(context).uiCancel.toUpperCase(), style: boldNormalText.copyWith(color: iconColorPurple),),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop(true);
                  },
                  child: Text(S.of(context).spellDetailRemoveFromCharAffirmative.toUpperCase(), style: boldNormalText.copyWith(color: iconColorPurple),),
                ),
              ],
            ),
          ]
      );
  }
}
