import 'dart:io';

import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/data/spell/distanceType.dart';
import 'package:dnd_beyonder/gui/Widgets/SettingsScreen/fileDialog.dart';
import 'package:dnd_beyonder/gui/Widgets/SettingsScreen/settingsButton.dart';
import 'package:dnd_beyonder/gui/Widgets/flipSwitchWidget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../permanentData/settings.dart';
import '../Widgets/SettingsScreen/itemDivider.dart';

class SettingsScreen extends StatefulWidget {
  final Function update;
  const SettingsScreen({super.key, required this.update});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Text(
            S.of(context).settingsLanguageLabel,
            style: headingText,
          ),
          const SizedBox(height: 10,),
          Center(
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: cardBackgroundColor,
              ),
              child: DropdownButton<Locale>(
                //label: Text(S.of(context).settingsLanguage),
                value: Settings.locale!,
                onChanged: (Locale? locale){
                  Settings.locale = locale;
                  S.load(locale!);
                  Settings.savePreferences();
                  widget.update();
                },
                items: S.delegate.supportedLocales.map<DropdownMenuItem<Locale>>(
                        (Locale locale) {
                          return DropdownMenuItem<Locale>(
                            value: locale,
                            child: Text(
                              S.of(context).settingsLanguages(locale.languageCode),
                              style: normalText,
                            ),
                          );
                        }
                ).toList(),
              ),
            ),
          ),
          Text(
            S.of(context).settingsLanguageDescription,
            style: normalText,
          ),
          const ItemDivider(),
          Text(
            S.of(context).settingsDistanceType,
            style: headingText,
          ),
          FlipSwitchWidget(leftLabel:
              S.of(context).meter,
              rightLabel: S.of(context).feet,
              left: Settings.distanceType! == DistanceType.meters,
              leftTap: (){
                Settings.distanceType = DistanceType.meters;
                widget.update();
              },
              rightTap: (){
                Settings.distanceType = DistanceType.feet;
                widget.update();
              },
          ),
          const ItemDivider(),
          Text(
            S.of(context).settingsData,
            style: headingText,
          ),
          const SizedBox(height: 20,),
          Center(
            child: SettingsButton(
              buttonText: S.of(context).settingsImport5e,
              onTap: () async{
                bool dialogRet = true;
                if(Settings.show5eMessage!){
                  dialogRet = await FileDialog.openDialog(
                      context,S.of(context).settingsImport5e,
                      S.of(context).settings5eMessage,
                      true,
                      (bool check)
                      {Settings.show5eMessage = !check;
                        widget.update();
                      });
                }
                if(dialogRet) {
                  FilePickerResult? result = await FilePicker.platform
                    .pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['json'],
                    );

                    if (result != null) {
                      File file = File(result.files.single.path!);
                    } else {
                      // User canceled the picker
                    }
                  //TODO Import 5e Spells
                }
              },
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: SettingsButton(
              buttonText: S.of(context).settingsImportData,
              onTap: () async{
                bool dialogRet = true;
                if(Settings.showAppMessage!){
                  dialogRet = await FileDialog.openDialog(
                      context,S.of(context).settingsImportData,
                      S.of(context).settingsAppMessage,
                      true,
                          (bool check)
                      {Settings.showAppMessage = !check;
                      widget.update();
                      });
                }
                if(dialogRet) {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['json'],
                  );

                  if (result != null) {
                    File file = File(result.files.single.path!);
                  } else {
                    // User canceled the picker
                  }
                  //TODO Import App Data
                }
              },
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: SettingsButton(
              buttonText: S.of(context).settingsExportData,
              onTap: () async{
                String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

                if (selectedDirectory == null) {
                  // User canceled the picker
                }
                //TODO Export App Data
              },
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: SettingsButton(
              buttonText: S.of(context).settingsDeleteData,
              onTap: () async{
                bool dialogRet = await FileDialog.openDialog(
                    context,S.of(context).settingsDeleteData,
                    S.of(context).settingsAppMessage,
                    true,
                        (bool check)
                    {Settings.showAppMessage = !check;
                    widget.update();
                    });
                //TODO Delete App Data
              },
            ),
          ),
          const ItemDivider(),
          Row(
            children: [
              Text(
                S.of(context).settingsAppVersionLabel,
                style: boldNormalText,
              ),
              Expanded(child: Container(),),
              Text(
                "${Settings.packageInfo!.version} (${Settings.packageInfo!.buildNumber})",
                style: subheadingText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
