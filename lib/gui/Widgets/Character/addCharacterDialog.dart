import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/gui/Widgets/dialogOptions.dart';
import 'package:dnd_beyonder/permanentData/boxHandler.dart';
import 'package:flutter/material.dart';

import '../../../data/character/character.dart';
import '../../../data/gui/constants.dart';
import '../../../generated/l10n.dart';
import '../SearchBarWidget.dart';

class AddCharacterDialog extends StatefulWidget {
  const AddCharacterDialog({super.key});

  @override
  State<AddCharacterDialog> createState() => _AddCharacterDialogState();

  static Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          scrollable: true,
          title: Text(S.of(context).characterAddTitle, style: headingText,),
          backgroundColor: scaffoldBackgroundColor,
          content: const AddCharacterDialog(),
      )
  );
}

class _AddCharacterDialogState extends State<AddCharacterDialog> {
  DnDClass _class = DnDClass.artificer;
  String _charName = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SearchBarWidget(
          searchText: _charName,
          onChanged: (String text){
            setState(() {
              _charName = text;
            });
          },
          hintText: S.of(context).characterName,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(S.of(context).characterClass, style: boldNormalText,),
        Center(
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: cardBackgroundColor,
            ),
            child: DropdownButton<DnDClass>(
              value: _class,
              onChanged: (DnDClass? dndClass){
                setState(() {
                  _class = dndClass!;
                });
              },
              items: DnDClass.values.map<DropdownMenuItem<DnDClass>>(
                      (DnDClass dndClass) {
                    return DropdownMenuItem<DnDClass>(
                      value: dndClass,
                      child: Text(
                        toDnDClassName(dndClass),
                        style: normalText,
                      ),
                    );
                  }
              ).toList(),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        DialogOptions(
            affirmative: S.of(context).uiDone.toUpperCase(),
            negative: S.of(context).uiCancel,
            disabled: _charName.isEmpty,
            positiveAction: (){
              Character character = Character(
                id: Character.maxId + 1,
                dnDClass: _class,
                name: _charName,
                spellIds: [],
              );
              BoxHandler.characterBox.put(character.id, character);
            },
        ),
      ],
    );
  }
}
