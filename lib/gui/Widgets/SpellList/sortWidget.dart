import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/sorting.dart';
import '../../../generated/l10n.dart';
import '../flipSwitchWidget.dart';

class SortWidget extends StatefulWidget {
  final bool asc;
  final Sorting sorting;
  final Function returnFunction;
  final List<Sorting> values;

  const SortWidget({
    required this.asc,
    required this.sorting,
    required this.returnFunction,
    required this.values,
    super.key
  });

  static Future openDialog(BuildContext context, Sorting sorting, bool asc, List<Sorting> values, Function updateSorting) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(S.of(context).sortBy, style: headingText,),
          backgroundColor: scaffoldBackgroundColor,
          content: SortWidget(
              asc: asc,
              sorting: sorting,
              values: values,
              returnFunction: updateSorting
          )
      )
  );

  @override
  State<SortWidget> createState() => _SortWidgetState();
}

class _SortWidgetState extends State<SortWidget> {
  Sorting? _sorting;
  bool? _asc;
  List<Sorting>? _values;

  @override
  void initState() {
    _sorting = widget.sorting;
    _asc = widget.asc;
    _values = widget.values;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for(Sorting sorting in _values!){
      children.add(ListTile(
        title: Text(sortingToString(sorting), style: normalText,),
        leading: Radio<Sorting>(
            value: sorting,
            activeColor: iconColorPurple,
            groupValue: _sorting,
            onChanged: (Sorting? value){
              setState(() {
                _sorting = value;
              });
        }),
      ));
    }
    children.add(
        FlipSwitchWidget(
          leftLabel: S.of(context).ascending,
          rightLabel: S.of(context).descending,
          left: _asc!,
          leftTap: (){setState(() {
            _asc = true;
          });},
          rightTap: (){setState(() {
            _asc = false;
          });},
        )
    );
    children.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).uiCancel.toUpperCase(), style: boldNormalText.copyWith(color: iconColorPurple),),
            ),
            Container(
              width: 48,
            ),
            InkWell(
              onTap: (){
                widget.returnFunction(_sorting, _asc);
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).uiDone.toUpperCase(), style: boldNormalText.copyWith(color: iconColorPurple),),
            ),
          ],
        )
    );
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
