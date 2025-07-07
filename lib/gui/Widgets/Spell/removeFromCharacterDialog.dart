import 'package:tavern_tome/data/character/character.dart';
import 'package:tavern_tome/data/spell/spell.dart';
import 'package:tavern_tome/gui/Widgets/dialogOptions.dart';
import 'package:tavern_tome/gui/Widgets/genericDialog.dart';
import 'package:tavern_tome/permanentData/boxHandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../data/gui/constants.dart';
import '../../../generated/l10n.dart';

class RemoveFromCharacterDialog extends StatelessWidget with GenericDialog{
  final Spell spell;
  final Character character;
  final Function update;
  final List<Character> characters = BoxHandler.characterBox.values.toList();
  RemoveFromCharacterDialog({super.key, required this.spell, required this.update, required this.character})
  {title=S.current.spellDetailRemoveFromCharTitle;}

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarkdownBody(
            data: S.of(context).spellDetailRemoveFromCharMessage(spell.getName(), character.name),
            styleSheet: markDownStyle,),
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
}
