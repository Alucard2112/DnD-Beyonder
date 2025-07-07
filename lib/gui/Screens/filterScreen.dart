import 'package:tavern_tome/data/gui/constants.dart';
import 'package:tavern_tome/gui/Widgets/FilterScreen/filterWidgetWithCheckbox.dart';
import 'package:flutter/material.dart';

import '../../data/filter.dart';
import '../../data/genericFilter.dart';
import '../../generated/l10n.dart';

class FilterScreen extends StatefulWidget {
  final Function back;
  final Function reset;
  final Filter filter;
  final int stateKey;
  const FilterScreen(this.back,this.reset,this.filter,{super.key, required this.stateKey});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  static final Map<int, Filter> _filterMap = {};

  void _changeVisible(int index){
    setState(() {
     _filterMap[widget.stateKey]!.changeVisibility(index);
    });
  }

  void _updateFilter(GenericFilter filter, dynamic value){
    setState(() {
      filter.updateFilter(value);
    });
  }

  void resetSpecific(GenericFilter filter){
    setState(() {
      filter.clear();
    });
  }

  @override
  void initState() {
    _filterMap[widget.stateKey] = widget.filter;
    super.initState();
  }

  Widget _createHeader(int index, bool show){
    Filter filter = _filterMap[widget.stateKey]!;
    return InkWell(
      onTap: (){
        _changeVisible(index);
      },
      child: SizedBox(
        height: 40,
        child: Row(
            children: [
              Expanded(child: Text(
                filter.translateCategory(filter.getCategory(index)),
                style: boldNormalText,)
              ),
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
    Filter filter = _filterMap[widget.stateKey]!;
    GenericFilter genericFilter = filter.getFilter(filter.filterCategories[index]);
    bool show = filter.showSubEntries(index);
    List<Widget> children = [];
    children.add(_createHeader(index, show));
    List<FilterTextCheckBoxWidget> subItems = [];
    if(show){
      for(dynamic entry in genericFilter.possibleEntries){
        subItems.add(
            FilterTextCheckBoxWidget(
              onTap: () {
                _updateFilter(genericFilter, entry);
              },
              label: genericFilter.translate(entry),
              isChecked: genericFilter.contains(entry),
            )
        );
      }
    }
    if(filter.sort[index]) {
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
          resetSpecific(genericFilter);
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
                child: Text(
                  S.of(context).filterReset,
                  style: labelText.copyWith(color: iconColorPurple),
                ),
              ),onTap: (){
                widget.reset();
                //Back
              },),
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: _filterMap[widget.stateKey]!.length(),
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

