import 'package:tavern_tome/data/gui/constants.dart';
import 'package:tavern_tome/gui/Screens/settingsScreen.dart';
import 'package:tavern_tome/gui/Screens/characterListScreen.dart';
import 'package:tavern_tome/gui/Screens/spellListScreen.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

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
      SpellListScreen(
        update: _update,
      ),
      CharacterListScreen(
        update: _update,
      ),
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
            icon: const Icon(Icons.person_rounded),
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
