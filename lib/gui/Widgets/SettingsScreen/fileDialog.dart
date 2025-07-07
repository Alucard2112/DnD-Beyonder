import 'package:tavern_tome/gui/Widgets/dialogOptions.dart';
import 'package:tavern_tome/gui/Widgets/genericDialog.dart';
import 'package:flutter/material.dart';

import '../../../data/gui/constants.dart';
import '../../../generated/l10n.dart';
import '../../../permanentData/settings.dart';
import '../FilterScreen/filterWidgetWithCheckbox.dart';

class FileDialog extends StatefulWidget with GenericDialog{
  final bool showCheckBox;
  final String text;
  final Function? update;
  FileDialog({super.key, required this.showCheckBox, required this.text, this.update, required String title}){
    super.title = title;
  }

  @override
  State<FileDialog> createState() => _FileDialogState();
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
