import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/data/dnd/dnd_class.dart';
import 'package:dnd_beyonder/data/spell/damageType.dart';
import 'package:dnd_beyonder/data/spell/spellFilter.dart';
import 'package:dnd_beyonder/data/spell/spellSchool.dart';
import 'package:dnd_beyonder/data/spell/time.dart';
import 'package:dnd_beyonder/data/spell/timeUnits.dart';
import 'package:dnd_beyonder/gui/Widgets/FilterScreen/filterWidgetWithCheckbox.dart';
import 'package:flutter/material.dart';

import '../../data/spell/spell.dart';
import '../../generated/l10n.dart';

class SpellFilterScreen extends StatefulWidget {
  final Function back;
  final Function reset;
  final SpellFilter filter;
  static final Set<Time> _timeData = {
    Time(1, TimeUnits.action),
    Time(1, TimeUnits.bonusAction),
    Time(1, TimeUnits.reaction),
    Time(1, TimeUnits.minute),
    Time(10, TimeUnits.minute),
    Time(1, TimeUnits.hour),
    Time(8, TimeUnits.hour),
    Time(12, TimeUnits.hour),
    Time(24, TimeUnits.hour),
  };
  const SpellFilterScreen(this.back,this.reset,this.filter,{super.key});

  @override
  State<SpellFilterScreen> createState() => _SpellFilterScreenState();
}

class _SpellFilterScreenState extends State<SpellFilterScreen> {
  static bool _notInitialized = true;
  static late final SpellFilter _spellFilter;

  void _changeVisible(int index){
    setState(() {
     _spellFilter.changeVisibility(index);
    });
  }

  void _updateDamageTypeFilter(SpellDamageType value){
    setState(() {
      if(_spellFilter.damageType.contains(value)){
        _spellFilter.damageType.remove(value);
      }
      else{
        _spellFilter.damageType.add(value);
      }
    });
  }

  void _updateClassesFilter(DnDClass value){
    setState(() {
      if(_spellFilter.classFilter.contains(value)){
        _spellFilter.classFilter.remove(value);
      }
      else{
        _spellFilter.classFilter.add(value);
      }
    });
  }

  void _updateSchoolFilter(SpellSchool value){
    setState(() {
      if(_spellFilter.schoolFilter.contains(value)){
        _spellFilter.schoolFilter.remove(value);
      }
      else{
        _spellFilter.schoolFilter.add(value);
      }
    });
  }

  void _updateTimeFilter(Time value){
    setState(() {
      if(_spellFilter.castTimeFilter.contains(value)){
        _spellFilter.castTimeFilter.remove(value);
      }
      else{
        _spellFilter.castTimeFilter.add(value);
      }
    });
  }

  void _updateLevelFilter(int i){
    setState(() {
      if(_spellFilter.levelFilter.contains(i)){
        _spellFilter.levelFilter.remove(i);
      }
      else {
        _spellFilter.levelFilter.add(i);
      }
    });
  }

  void _resetClasses(){
    setState(() {
      _spellFilter.classFilter.clear();
    });
  }

  void _resetCastTime(){
    setState(() {
      _spellFilter.castTimeFilter.clear();
    });
  }

  void _resetSchools(){
    setState(() {
      _spellFilter.schoolFilter.clear();
    });
  }

  void _resetDamage(){
    setState(() {
      _spellFilter.damageType.clear();
    });
  }

  void _resetLevel(){
    setState(() {
      _spellFilter.levelFilter.clear();
    });
  }

  @override
  void initState() {
    if(_notInitialized) {
      _spellFilter = widget.filter;
      _notInitialized = false;
    }
    super.initState();
  }

  Widget _createHeader(int index, bool show){
    return InkWell(
      onTap: (){
        _changeVisible(index);
      },
      child: SizedBox(
        height: 40,
        child: Row(
            children: [
              Expanded(child: Text(_spellFilter.getCategory(index), style: boldNormalText,)),
              Icon(show ?
              Icons.keyboard_arrow_up_rounded :
              Icons.keyboard_arrow_down_rounded,
                size: 20,
                color: textColor,)
            ]
        ),
      ),
    );
  }

  List<Widget> _createChildren(int index){
    bool show = _spellFilter.showSubEntries(index);
    List<Widget> children = [];
    children.add(_createHeader(index, show));
    List<FilterTextCheckBoxWidget> subItems = [];
    if(show){
      switch(index){
        case 0:
          for(DnDClass classes in DnDClass.values){
            subItems.add(
                FilterTextCheckBoxWidget(
                  onTap: () {
                    _updateClassesFilter(classes);
                  },
                  label: toDnDClassName(classes),
                  isChecked: _spellFilter.classFilter.contains(classes),
                )
            );
          }
          break;

        case 1:
          for(int i = 0; i < 10; i++){
            subItems.add(
              FilterTextCheckBoxWidget(
                onTap: (){
                  _updateLevelFilter(i);
                },
                label: Spell.getLevelString(i),
                isChecked: _spellFilter.levelFilter.contains(i),
              )
            );
          }
          break;

        case 2:
          for(Time time in SpellFilterScreen._timeData){
            subItems.add(
                FilterTextCheckBoxWidget(
                  onTap: (){
                    _updateTimeFilter(time);
                  },
                  label: time.toString(),
                  isChecked: _spellFilter.castTimeFilter.contains(time),
                )
            );
          }

          break;

        case 3:
          for(SpellSchool school in SpellSchool.values){
            subItems.add(
              FilterTextCheckBoxWidget(
                onTap: (){_updateSchoolFilter(school);},
                label: spellSchoolToString(school),
                isChecked: _spellFilter.schoolFilter.contains(school),
              )
            );
          }
          break;

        case 4:
          for(SpellDamageType type in SpellDamageType.values){
            subItems.add(
                FilterTextCheckBoxWidget(
                    onTap: () {
                      _updateDamageTypeFilter(type);
                    },
                    label: spellDamageTypeToName(type),
                    isChecked: _spellFilter.damageType.contains(type),
                )
            );
          }
          break;
      }
    }
    if(index != 1 && index != 2) {
      subItems.sort((FilterTextCheckBoxWidget a, FilterTextCheckBoxWidget b) {
        return a.label.compareTo(b.label);
      });
    }
    children.add(
        Column(
          children: subItems,
        )
    );
    if(show){
    children.add(
      InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  S.of(context).filterUnselect,
                  style: normalText,
                ),
              ),
            ),
          ],
        ),
        onTap: (){
          switch(index){
            case 0:
              _resetClasses();
              break;
            case 1:
              _resetLevel();
              break;
            case 2:
              _resetCastTime();
              break;
            case 3:
              _resetSchools();
              break;
            case 4:
              _resetDamage();
              break;
          }
        },
      ),
    );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:(bool didPop, Object? result) async {
        if(didPop){
          return;
        }
        widget.back(false);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child:  Icon(Icons.close, color: textColor, size: 28,),
              ),onTap: (){
                //Back
                widget.back(false);
              },),
              Expanded(child: Text(S.of(context).filterSpells, style: boldNormalText,)),
              InkWell(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(S.of(context).filterReset, style: labelText,),
              ),onTap: (){
                widget.reset();
                //Back
              },),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: _spellFilter.length(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  //color: Colors.amber[colorCodes[index]],
                  children: _createChildren(index),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}

