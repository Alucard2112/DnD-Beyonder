import 'package:flutter/material.dart';

import '../../data/gui/constants.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  const CardWidget({required this.child, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          color: cardBackgroundColor,
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          child: child,
          ),
      ),
    );
  }
}
