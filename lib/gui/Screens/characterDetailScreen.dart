import 'package:tavern_tome/data/dnd/dnd_class.dart';
import 'package:tavern_tome/data/gui/constants.dart';
import 'package:tavern_tome/data/character/character.dart';
import 'package:tavern_tome/gui/Screens/spellListScreen.dart';
import 'package:tavern_tome/gui/Widgets/Character/addCharacterDialog.dart';
import 'package:tavern_tome/gui/Widgets/Character/addSpellsToCharacterDialog.dart';
import 'package:tavern_tome/gui/Widgets/Character/deleteCharacterDialog.dart';
import 'package:tavern_tome/gui/Widgets/clickableIcon.dart';
import 'package:tavern_tome/permanentData/boxHandler.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  final Function back;
  final Function update;
  const CharacterDetailScreen({required this.back, required this.character, super.key, required this.update});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:(bool didPop, Object? result) async {
        if(didPop){
          return;
        }
        back();
      },
      child: Column(
        children: [Container(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                back();
              },
              child: Row(
                children: [
                  const SizedBox(
                    height: 20,
                    child: Icon(Icons.arrow_back_outlined, color: textColor,),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                  SizedBox(
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/class_icons/${character.dnDClass.name}.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(character.name, style: boldNormalText,),
                      Text(toDnDClassName(character.dnDClass), style: subheadingText,)
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            ClickableIcon(
              onTap: (){
                AddSpellsToCharacterDialog(
                  spells: BoxHandler.spellBox.values.toList(),
                  character: character,
                  update: update,
                ).openDialog(context);
              },
              icon: Icons.add_circle,
            ),
            const SizedBox(
              width: 10,
            ),
            ClickableIcon(
              onTap: () async{
                await AddCharacterDialog(
                  character: character,
                ).openDialog(context);
                update();
              },
              icon: Icons.edit,
            ),
            const SizedBox(
              width: 10,
            ),
            ClickableIcon(
              onTap: () async{
                bool decision = await DeleteCharacterDialog(
                  character: character,
                ).openDialog(context);
                if(decision) {
                  BoxHandler.characterBox.delete(character.id);
                  back();
                  update();
                }
              },
              icon: Icons.delete,
            )
          ],
        ),
      ),
          Expanded(
              child: SpellListScreen(
                update: (){},
                character: character,
              ),
          ),
      ],
      ),
    );
  }
}
