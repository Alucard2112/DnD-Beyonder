import 'package:flutter/material.dart';

import '../../data/gui/constants.dart';

class GenericCheckBoxWidget extends StatelessWidget {
  final bool disabled;
  final bool value;
  const GenericCheckBoxWidget({super.key, required this.disabled, required this.value});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.2,
      child: Checkbox(
        value: value,
        isError: !disabled,
        fillColor: disabled? disabledStyle : enabledStyle,
        side: const BorderSide(
          color: checkBoxBorderColor,
          width: 2,
        ),
        checkColor: textColor,
        onChanged: null,
      ),
    );
  }
}
