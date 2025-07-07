import 'package:flutter/widgets.dart';

import '../../data/gui/constants.dart';

class EntryWidget extends StatelessWidget {
  final String entry;
  final String value;
  const EntryWidget(this.entry, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
            entry,
            style: boldNormalText
        ),
        Text(
          value,
          style: normalText,
        )
      ],
    );
  }
}
