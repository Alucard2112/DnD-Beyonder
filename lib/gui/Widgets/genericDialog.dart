import 'package:flutter/material.dart';

import '../../data/gui/constants.dart';

mixin GenericDialog on StatelessWidget{
  late final String title;

  Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          scrollable: true,
          title: Text(title, style: headingText,),
          backgroundColor: scaffoldBackgroundColor,
          content: this,
      )
  );
}