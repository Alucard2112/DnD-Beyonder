import 'package:dnd_beyonder/data/character/character.dart';
import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/gui/Widgets/dialogOptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../generated/l10n.dart';
import '../genericDialog.dart';

class DeleteCharacterDialog extends StatelessWidget with GenericDialog {
  final Character character;
  DeleteCharacterDialog({super.key, required this.character}){
   title = S.current.characterDeleteTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MarkdownBody(
          data: S.of(context).characterDeleteMessage(character.name),
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
