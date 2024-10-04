import 'package:flutter/material.dart';

import '../../../data/gui/constants.dart';

class SettingsButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String buttonText;
  final TextStyle textStyle;
  final Color borderColor;
  const SettingsButton({super.key,
    this.borderColor = iconColorPurple,
    this.textStyle = boldNormalText,
    this.onTap,
    required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          buttonText,
          style: textStyle,
        ),
      ),
    );
  }
}
