import 'package:flutter/material.dart';

import '../../data/gui/constants.dart';
import '../../data/gui/sorting.dart';
import 'SpellList/sortWidget.dart';

class SortUiButtonWidget extends StatelessWidget {
  final Sorting sorting;
  final bool asc;
  final Function callBack;
  final List<Sorting> values;
  const SortUiButtonWidget({super.key, required this.sorting, required this.asc, required this.callBack, required this.values});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        SortWidget.openDialog(context, sorting, asc, values, callBack);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(sortingToString(sorting), style: boldNormalText.copyWith(color: iconColorPurple),),
          Container(
            width: 6,
          ),
          Transform.scale(
            scale: 1.8,
            child: Icon(
              asc ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down,
              color: iconColorPurple,
            ),
          ),
        ],
      ),
    );
  }
}
