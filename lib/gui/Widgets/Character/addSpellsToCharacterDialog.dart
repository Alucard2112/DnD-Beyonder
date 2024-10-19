import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/gui/Widgets/genericDialog.dart';
import 'package:flutter/material.dart';

import '../../../data/character/character.dart';
import '../../../data/gui/constants.dart';
import '../../../generated/l10n.dart';
import '../../../permanentData/boxHandler.dart';
import '../../../permanentData/settings.dart';
import '../dialogOptions.dart';
import '../emptyDataWidget.dart';
import '../genericCheckBoxWidget.dart';

class AddSpellsToCharacterDialog extends StatefulWidget with GenericDialog{
  final List<Spell> spells;
  final Character character;
  final Function update;

  AddSpellsToCharacterDialog({super.key, required this.spells, required this.character, required this.update}) {
    title = S.current.spellDetailAddSpellTitle;
    spells.sort((Spell a, Spell b)=>a.getName(Settings.locale!).compareTo(b.getName(Settings.locale!)));
  }

  @override
  State<AddSpellsToCharacterDialog> createState() => _AddSpellsToCharacterDialogState();
}

class _AddSpellsToCharacterDialogState extends State<AddSpellsToCharacterDialog> {
  late final List<bool> _checked;

  @override
  void initState() {
    _checked = List.filled(BoxHandler.spellBox.length, false, growable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(_checked.isEmpty){
      return EmptyDataWidget(message: S.of(context).characterNoSpells,);
    }
    List<Widget> children = [];
    for(int i = 0; i < widget.spells.length; i++){
      Spell spell = widget.spells[i];
      bool disabled = widget.character.spellIds.contains(spell.id);
      if(disabled) {
        _checked[i] = true;
      }

      children.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              onTap: disabled ? null : (){
                setState(() {
                  _checked[i] = !_checked[i];
                });
              },
              child: Row(
                children: [
                  GenericCheckBoxWidget(disabled: disabled, value: _checked[i],),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(spell.getName(Settings.locale!), style: headingText,),
                      Text(spell.getSchoolLevelForUI(), style: subheadingText,)
                    ],
                  )
                ],
              ),
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
                  Spell spell = widget.spells[i];
                  if(widget.character.spellIds.contains(spell.id)){

                  }
                  else{
                    widget.character.spellIds.add(spell.id);
                    widget.character.save();
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
