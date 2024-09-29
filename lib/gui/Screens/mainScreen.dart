import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/gui/Screens/spellBookListScreen.dart';
import 'package:dnd_beyonder/gui/Screens/spellListScreen.dart';
import 'package:flutter/material.dart';

import '../../data/spell/spell.dart';
import '../../data/spellbook/spellbook.dart';

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

  @override
  Widget build(BuildContext context) {
    final List<Spell> spells = Spell.spellListFromJson(testJson);
    final List<Widget> widgetOptions = <Widget>[
     SpellListScreen(spells),
      SpellBookListScreen(books: [
        SpellBook(id: 0, name: "Atreus", dnDClass: DnDClass.druid,spells: spells),
        SpellBook(id: 1, name: "Bertrand", dnDClass: DnDClass.monk,spells: []),
        SpellBook(id: 2, name: "Caius", dnDClass: DnDClass.cleric,spells: []),
        SpellBook(id: 3, name: "Darius", dnDClass: DnDClass.bard,spells: []),
        SpellBook(id: 4, name: "Emma", dnDClass: DnDClass.warlock,spells: []),
        SpellBook(id: 5, name: "Fauna", dnDClass: DnDClass.artificer,spells: []),
      ],),
      const Text(
        'Nicht implementiert',
        style: optionStyle,
      ),
      const Text(
        'Nicht implementiert',
        style: optionStyle,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Zauberliste',
            backgroundColor: bottomNavigationBarColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Zauberbücher',
            backgroundColor: bottomNavigationBarColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Hinzufügen",
            backgroundColor: bottomNavigationBarColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Einstellungen",
            backgroundColor: bottomNavigationBarColor,
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: bottomBackgroundColor,
        selectedItemColor: itemSelectedColor,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(color: textColor),
        unselectedLabelStyle: const TextStyle(color: textColor),
        onTap: _onItemTapped,
      ),
      backgroundColor: scaffoldBackgroundColor,
    );
  }
}
