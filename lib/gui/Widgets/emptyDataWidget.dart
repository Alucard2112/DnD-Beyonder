import 'package:flutter/material.dart';

import '../../data/gui/constants.dart';
import '../../generated/l10n.dart';

class EmptyDataWidget extends StatelessWidget {
  final String message;
  const EmptyDataWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message, style: normalText,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pop(true);
                },
                child: Text(S.of(context).uiOK.toUpperCase(), style: boldNormalText.copyWith(color: iconColorPurple),),
              ),
            ],
          ),
        ]
    );
  }
}
