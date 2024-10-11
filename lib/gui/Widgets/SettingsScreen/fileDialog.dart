import 'package:dnd_beyonder/gui/Widgets/dialogOptions.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/constants.dart';
import '../../../generated/l10n.dart';
import '../../../permanentData/settings.dart';
import '../FilterScreen/filterWidgetWithCheckbox.dart';

class FileDialog extends StatefulWidget {
  final bool showCheckBox;
  final String text;
  final Function? update;
  const FileDialog({super.key, required this.showCheckBox, required this.text, this.update});

  @override
  State<FileDialog> createState() => _FileDialogState();

  static Future openDialog(BuildContext context, String title, String text, bool showCheckBox, Function? update) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(title, style: headingText,),
          backgroundColor: scaffoldBackgroundColor,
          content: FileDialog(
            update: update,
            showCheckBox: showCheckBox,
            text: text,
          )
      )
  );
}

class _FileDialogState extends State<FileDialog> {
  bool _checked = false;

  void _updateCheck(){
    setState(() {
      _checked = !_checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: normalText,
        ),
        widget.showCheckBox ? const SizedBox(height: 20,) : Container(),
        widget.showCheckBox ? FilterTextCheckBoxWidget(
          onTap: () {
            _updateCheck();
          },
          label: S.of(context).settingsDoNotShowMessageAgain,
          isChecked: _checked,
        ) : Container(),
        const SizedBox(height: 20,),
        DialogOptions(
          affirmative: S.of(context).uiOK,
          negative: S.of(context).uiCancel,
          positiveAction: (){
            if(widget.update != null) {
              widget.update!(_checked);
            }
            Settings.savePreferences();
          },
        ),
      ],
    );
  }
}
