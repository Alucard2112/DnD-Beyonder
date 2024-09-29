import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/data/gui/sorting.dart';
import 'package:dnd_beyonder/data/sortable.dart';
import 'package:dnd_beyonder/data/spell/damageType.dart';
import 'package:dnd_beyonder/data/spell/sourceBook.dart';
import 'package:dnd_beyonder/data/spell/spell.dart';
import 'package:dnd_beyonder/gui/Widgets/cardWidget.dart';
import 'package:flutter/material.dart';

import '../../../data/spell/spellSchool.dart';

class SpellListItemWidget extends StatelessWidget with Sortable<SpellListItemWidget>{
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
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(spell.name, style: headingText,),
                    Text(spell.getSchoolLevelForUI(), style: subheadingTextBold,),
                    Text(sourceBookToString(spell.source), style: subheadingText,),
                  ],
                  )
                ],
          ),
        );
  }

  @override
  int sortName(SpellListItemWidget b) {
    return spell.name.compareTo(b.spell.name);
  }

  @override
  int sortLevel(SpellListItemWidget b) {
    return spell.level.compareTo(b.spell.level);
  }

  @override
  int sortDnDClass(SpellListItemWidget b) {
    return spell.mainClasses.elementAt(0).name.compareTo(b.spell.mainClasses.elementAt(0).name);
  }

  @override
  int sortAttackType(SpellListItemWidget b) {
    if(spell.damageInflict.isNotEmpty && b.spell.damageInflict.isNotEmpty) {
      return
          spellDamageTypeToName(spell.damageInflict[0]).compareTo(
              spellDamageTypeToName(b.spell.damageInflict[0]));
    }
    return (spell.damageInflict.isNotEmpty ? 1 : -1);
  }

  @override
  int sortSchool(SpellListItemWidget b) {
    return spellSchoolToString(spell.school).compareTo(spellSchoolToString(b.spell.school));
  }

  @override
  int sortSource(SpellListItemWidget b) {
    return sourceBookToString(spell.source).compareTo(sourceBookToString(b.spell.source));

  }
}
