import 'package:dnd_beyonder/data/character/character.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/gui/Widgets/dialogOptions.dart';
import 'package:dnd_beyonder/permanentData/boxHandler.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/constants.dart';
import '../../../generated/l10n.dart';

class RemoveFromCharacterDialog extends StatelessWidget {
  final Spell spell;
  final Character character;
  final Function update;
  final List<Character> characters = BoxHandler.characterBox.values.toList();
  RemoveFromCharacterDialog({super.key, required this.spell, required this.update, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).spellDetailRemoveFromCharMessage(spell.name, character.name), style: normalText,),
          const SizedBox(
            height: 20,
          ),
          DialogOptions(
            affirmative: S.of(context).spellDetailRemoveFromCharAffirmative,
            negative: S.of(context).uiCancel,
          ),
        ]
    );
  }

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
