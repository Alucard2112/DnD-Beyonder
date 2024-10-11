import 'package:flutter/material.dart';

import '../../data/gui/constants.dart';

class DialogOptions extends StatelessWidget {
  final String affirmative;
  final String? negative;
  final Function? positiveAction;
  final Function? negativeAction;
  final bool disabled;
  const DialogOptions({super.key, required this.affirmative, this.negative, this.positiveAction, this.negativeAction, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if(negative != null){
      children.add(
        InkWell(
          onTap: (){
            if(negativeAction!=null){
              negativeAction!();
            }
            Navigator.of(context).pop(false);
          },
          child: Text(negative!.toUpperCase(), style: boldNormalText.copyWith(color: iconColorPurple),),
        ),
      );
      children.add(
        const SizedBox(
          width: 20,
        ),
      );
    }
    children.add(
        InkWell(
          onTap: disabled ? null : (){
              if (positiveAction != null) {
                positiveAction!();
              }
              Navigator.of(context).pop(true);
          },
          child: Text(
            affirmative.toUpperCase(),
            style: boldNormalText.copyWith(
                color: disabled ? searchBarColor : iconColorPurple,
            ),
          ),
        )
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: children,
    );
  }
}
