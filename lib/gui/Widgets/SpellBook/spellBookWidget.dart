import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/spellbook/spellbook.dart';
import 'package:dnd_beyonder/gui/Widgets/cardWidget.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/constants.dart';
import '../../../data/sortable.dart';
import '../../../generated/l10n.dart';

class SpellBookWidget extends StatelessWidget with Sortable<SpellBookWidget>{
  final SpellBook spellBook;
  final GestureTapCallback? onTap;

  const SpellBookWidget({this.onTap, required this.spellBook,super.key});

  @override
  int sortName(SpellBookWidget b){
    return spellBook.name.compareTo(b.spellBook.name);
  }

  @override
  int sortDnDClass(SpellBookWidget b) {
    return toDnDClassName(spellBook.dnDClass).compareTo(toDnDClassName(b.spellBook.dnDClass));
  }

  @override
  int sortSpellCount(SpellBookWidget b) {
        return spellBook.spells.length.compareTo(b.spellBook.spells.length);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardWidget(
          child:Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child:  Image.asset('assets/images/class_icons/${spellBook.dnDClass.name}.png'),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10)),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(spellBook.name, style: headingText,),
                      Text(toDnDClassName(spellBook.dnDClass), style: subheadingTextBold,),
                      Text(S.of(context).spellBookSpellCount(spellBook.spells.length), style: subheadingText,),
                    ],
                  )
              ),
            ],
          ),

      ),
    );
  }
}
