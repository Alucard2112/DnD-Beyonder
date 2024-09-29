import 'package:flutter/material.dart';

import '../../data/gui/constants.dart';

class FlipSwitchWidget extends StatelessWidget {
  final String leftLabel;
  final String rightLabel;
  final bool left;
  final GestureTapCallback? leftTap;
  final GestureTapCallback? rightTap;
  const FlipSwitchWidget({super.key, required this.leftLabel, required this.rightLabel, required this.left, required this.leftTap, required this.rightTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        border: Border.all(color: iconColorPurple),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: leftTap,
              child: Container(
                color: left ? iconColorPurple : Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: IntrinsicWidth(
                  child: Center(
                    child: Text(
                      leftLabel,
                      style: boldNormalText,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: rightTap,
              child: Container(
                color: left ? Colors.transparent : iconColorPurple,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: IntrinsicWidth(
                  child: Center(
                    child: Text(
                      rightLabel,
                      style: boldNormalText,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
