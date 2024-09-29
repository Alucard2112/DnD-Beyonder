import 'package:flutter/material.dart';

import '../../data/gui/constants.dart';

class ClickableIcon extends StatelessWidget {
  final String badgeText;
  late final Color _badgeBackgroundColor;
  final GestureTapCallback? onTap;
  final IconData icon;
  ClickableIcon({this.badgeText="",required this.onTap, super.key, required this.icon}){
    _badgeBackgroundColor = badgeText == "" ? Colors.transparent : itemSelectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Badge(
        label: Text(badgeText),
        backgroundColor: _badgeBackgroundColor,
        child: Icon(
          icon,
          color: iconColorPurple,
          size: 30.0,
        ),
      ),
    );
  }
}
