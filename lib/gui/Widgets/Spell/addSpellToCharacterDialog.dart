import 'package:tavern_tome/data/character/character.dart';
import 'package:tavern_tome/data/spell/spell.dart';
import 'package:tavern_tome/gui/Widgets/dialogOptions.dart';
import 'package:tavern_tome/gui/Widgets/emptyDataWidget.dart';
import 'package:tavern_tome/gui/Widgets/genericDialog.dart';
import 'package:tavern_tome/permanentData/boxHandler.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/constants.dart';
import '../../../generated/l10n.dart';
import '../genericCheckBoxWidget.dart';

class AddSpellToCharactersDialog extends StatefulWidget with GenericDialog{
  final Spell spell;
  final Function update;
  final List<Character> characters = BoxHandler.characterBox.values.toList();
  AddSpellToCharactersDialog({super.key, required this.spell, required this.update}){
    title = S.current.spellDetailAddSpellTitle;
  }

  @override
  State<AddSpellToCharactersDialog> createState() => _AddSpellToCharactersDialogState();
}

class _AddSpellToCharactersDialogState extends State<AddSpellToCharactersDialog> {
  late final List<bool> _checked;

  @override
  void initState() {
    _checked = List.filled(BoxHandler.characterBox.length, false, growable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_checked.isEmpty){
      return EmptyDataWidget(message: S.of(context).spellDetailAddSpellNoChars,);
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
