import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/data/spell/sourceBook.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/gui/Widgets/cardWidget.dart';
import 'package:flutter/material.dart';

import '../../../data/spell/spellSchool.dart';

class SpellListItemWidget extends StatelessWidget{
  final Spell spell;
  final Function onTap;
  const SpellListItemWidget(this.spell, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return
      CardWidget(
        onTap: (){
          onTap();
        },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/spell_schools/${getIconNameFromSchool(spell.school)}.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10)),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(spell.getName(), style: headingText,),
                    Text(spell.getSchoolLevelForUI(), style: subheadingTextBold,),
                    Text(sourceBookToString(spell.source), style: subheadingText,),
                  ],
                ),
              )
            ],
          ),
        );
  }
}
