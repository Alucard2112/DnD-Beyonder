import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/gui/Screens/settingsScreen.dart';
import 'package:dnd_beyonder/gui/Screens/characterListScreen.dart';
import 'package:dnd_beyonder/gui/Screens/spellListScreen.dart';
import 'package:dnd_beyonder/permanentData/boxHandler.dart';
import 'package:flutter/material.dart';

import '../../data/character/character.dart';
import '../../generated/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: textColor);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _update(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
     SpellListScreen(BoxHandler.spellBox.values.toList()),
      CharacterListScreen(books: [
        Character(id: 0, name: "Atreus", dnDClass: DnDClass.druid,spellIds: []),
        Character(id: 1, name: "Bertrand", dnDClass: DnDClass.monk,spellIds: []),
        Character(id: 2, name: "Caius", dnDClass: DnDClass.cleric,spellIds: []),
        Character(id: 3, name: "Darius", dnDClass: DnDClass.bard,spellIds: []),
        Character(id: 4, name: "Emma", dnDClass: DnDClass.warlock,spellIds: []),
        Character(id: 5, name: "Fauna", dnDClass: DnDClass.artificer,spellIds: []),
      ],),
      SettingsScreen(update: _update),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: S.of(context).mainScreenSpellList,
            backgroundColor: bottomNavigationBarColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: S.of(context).mainScreenSpellBooks,
            backgroundColor: bottomNavigationBarColor,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: S.of(context).mainScreenSettings,
            backgroundColor: bottomNavigationBarColor,
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: bottomBackgroundColor,
        selectedItemColor: itemSelectedColor,
        unselectedItemColor: subheadingColor,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(color: textColor),
        unselectedLabelStyle: const TextStyle(color: textColor),
        onTap: _onItemTapped,
      ),
      backgroundColor: scaffoldBackgroundColor,
    );
  }
}
