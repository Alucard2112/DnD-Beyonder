import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/character/character.dart';
import 'package:dnd_beyonder/gui/Widgets/cardWidget.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/constants.dart';
import '../../../data/sortable.dart';
import '../../../generated/l10n.dart';

class CharacterWidget extends StatelessWidget with Sortable<CharacterWidget>{
  final Character spellBook;
  final GestureTapCallback? onTap;

  const CharacterWidget({this.onTap, required this.spellBook,super.key});

  @override
  int sortName(CharacterWidget b){
    return spellBook.name.compareTo(b.spellBook.name);
  }

  @override
  int sortDnDClass(CharacterWidget b) {
    return toDnDClassName(spellBook.dnDClass).compareTo(toDnDClassName(b.spellBook.dnDClass));
  }

  @override
  int sortSpellCount(CharacterWidget b) {
        return spellBook.spellIds.length.compareTo(b.spellBook.spellIds.length);
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
                      Text(S.of(context).spellBookSpellCount(spellBook.spellIds.length), style: subheadingText,),
                    ],
                  )
              ),
            ],
          ),

      ),
    );
  }
}
