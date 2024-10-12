import 'package:dnd_beyonder/data/character/character.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/gui/Widgets/dialogOptions.dart';
import 'package:dnd_beyonder/gui/Widgets/genericDialog.dart';
import 'package:dnd_beyonder/permanentData/boxHandler.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/constants.dart';
import '../../../generated/l10n.dart';
import '../genericCheckBoxWidget.dart';

class AddSpellToCharacterDialog extends StatefulWidget with GenericDialog{
  final Spell spell;
  final Function update;
  final List<Character> characters = BoxHandler.characterBox.values.toList();
  AddSpellToCharacterDialog({super.key, required this.spell, required this.update}){
    title = S.current.spellDetailAddSpellTitle;
  }

  @override
  State<AddSpellToCharacterDialog> createState() => _AddSpellToCharacterDialogState();
}

class _AddSpellToCharacterDialogState extends State<AddSpellToCharacterDialog> {
  late final List<bool> _checked;

  @override
  void initState() {
    _checked = List.filled(BoxHandler.characterBox.length, false, growable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_checked.isEmpty){
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).spellDetailAddSpellNoChars, style: normalText,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pop(true);
                },
                child: Text(S.of(context).uiOK.toUpperCase(), style: boldNormalText.copyWith(color: iconColorPurple),),
              ),
            ],
          ),
        ]
      );
    }

    List<Widget> children = [];
    for(int i = 0; i < widget.characters.length; i++){
      Character character = widget.characters[i];
      bool disabled = character.spellIds.contains(widget.spell.id);
      if(disabled) {
        _checked[i] = true;
      }

      children.add(
          InkWell(
            onTap: disabled ? null : (){
              setState(() {
                _checked[i] = !_checked[i];
              });
            },
            child: Row(
              children: [
                GenericCheckBoxWidget(disabled: disabled, value: _checked[i],),
                Text(character.name, style: boldNormalText,)
              ],
            ),
          )
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: SingleChildScrollView(
            child: ListBody(children: children),
          ),
        ),
        const SizedBox(height: 20,),
        DialogOptions(
            affirmative: S.of(context).uiOK,
            negative: S.of(context).uiCancel,
            positiveAction: (){
              for(int i = 0; i < _checked.length; i++){
                if(_checked[i]){
                  Character character = widget.characters[i];
                  if(character.spellIds.contains(widget.spell.id)){

                  }
                  else{
                    character.spellIds.add(widget.spell.id);
                    character.spells.add(widget.spell);
                    character.save();
                  }
                }
              }
              widget.update();
            }
         ),
      ],
    );
  }
}
