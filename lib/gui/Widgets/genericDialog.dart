import 'package:flutter/material.dart';

import '../../data/gui/constants.dart';

mixin GenericDialog on Widget{
  late final String title;

  Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          scrollable: false,
          title: Text(title, style: headingText,),
          backgroundColor: scaffoldBackgroundColor,
          content: this,
      )
  );
}