import 'package:flutter/material.dart';

import '../../../data/gui/constants.dart';

class FilterTextCheckBoxWidget extends StatelessWidget {

  final GestureTapCallback onTap;
  final String label;
  final bool isChecked;

  const FilterTextCheckBoxWidget({required this.onTap, required this.label, required this.isChecked, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  const EdgeInsets.only(left: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: normalText,
              ),
            ),
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: isChecked,
                isError: true,
                fillColor: WidgetStateProperty.resolveWith((states) {
                  if (!states.contains(WidgetState.selected)) {
                    return checkBoxBackgroundColorUnchecked;
                  }
                  return iconColorPurple;
                }),
                side: const BorderSide(
                  color: checkBoxBorderColor,
                  width: 2,
                ),
                checkColor: textColor,
                onChanged: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
