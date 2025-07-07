import 'package:tavern_tome/data/gui/constants.dart';
import 'package:tavern_tome/data/spell/spell.dart';
import 'package:tavern_tome/gui/Widgets/dialogOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../generated/l10n.dart';
import '../genericDialog.dart';

class DeleteSpellDialog extends StatelessWidget with GenericDialog {
  final Spell spell;
  DeleteSpellDialog({super.key, required this.spell}){
    title = S.current.spellDetailDeleteTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MarkdownBody(
          data: S.of(context).spellDetailDeleteMessage(spell.name),
          styleSheet: markDownStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        DialogOptions(
          affirmative: S.of(context).characterDeleteOk,
          negative: S.of(context).uiCancel,
        ),
      ],
    );
  }
}
