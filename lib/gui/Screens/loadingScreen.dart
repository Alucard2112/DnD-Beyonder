import 'package:dnd_beyonder/gui/Screens/mainScreen.dart';
import 'package:dnd_beyonder/permanentData/boxHandler.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../permanentData/settings.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _loaded = false;

  void _loadData() async{
    await Settings.loadPreferences();
    await S.load(Settings.locale!);
    await BoxHandler.initialise();
    setState(() {
      _loaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if(_loaded){
      return const MainScreen();
    }
    //TODO Beautiful Loading Screen
    return const Placeholder();
  }
}
