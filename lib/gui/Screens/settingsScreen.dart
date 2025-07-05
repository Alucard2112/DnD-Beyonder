  import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/data/spell/distanceType.dart';
import 'package:dnd_beyonder/gui/Widgets/SettingsScreen/fileDialog.dart';
import 'package:dnd_beyonder/gui/Widgets/SettingsScreen/settingsButton.dart';
import 'package:dnd_beyonder/gui/Widgets/flipSwitchWidget.dart';
import 'package:dnd_beyonder/permanentData/boxHandler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../data/character/character.dart';
import '../../data/spell/spell.dart';
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
    final s = S.of(context);
    final scaffold = ScaffoldMessenger.of(context);
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
                  dialogRet = await FileDialog(
                    title: S.of(context).settingsImport5e,
                    text: S.of(context).settings5eMessage,
                    showCheckBox: true,
                    update: (bool check)
                    {Settings.show5eMessage = !check;
                    widget.update();
                    },
                  ).openDialog(context);
                }
                if(dialogRet) {
                  FilePickerResult? result = await FilePicker.platform
                    .pickFiles(
                      allowMultiple: true,
                      type: FileType.custom,
                      allowedExtensions: ['json'],
                    );

                    if (result != null) {
                      List<File> files = result.paths.map((path) => File(path!)).toList();
                      for(File file in files) {
                        String jsonString = await file.readAsString();
                        final json = jsonDecode(jsonString);
                        if (json is List<dynamic>) {
                          for (Map<String, dynamic> map in json) {
                            Spell spell = Spell.from5eJsonObject(map);
                            BoxHandler.spellBox.put(spell.id, spell);
                          }
                        }
                        else {
                          Spell spell = Spell.from5eJsonObject(json);
                          BoxHandler.spellBox.put(spell.id, spell);
                        }
                        widget.update();
                      }
                    } else {
                      // User canceled the picker
                    }
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
                  dialogRet = await FileDialog(
                    title: S.of(context).settingsImportData,
                    text: S.of(context).settingsAppMessage,
                    showCheckBox: true,
                    update: (bool check)
                    {Settings.showAppMessage = !check;
                    widget.update();
                    },
                  ).openDialog(context);
                }
                if(dialogRet) {
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['json'],
                  );

                  if (result != null) {
                    File file = File(result.files.single.path!);
                    String jsonString = await file.readAsString();
                    Map<String, dynamic> import = jsonDecode(jsonString);
                    for(Map<String, dynamic> map in import["spells"]){
                      Spell spell = Spell.fromJson(map);
                      BoxHandler.spellBox.put(spell.id, spell);
                    }
                    for(Map<String, dynamic> map in import["characters"]){
                      Character char = Character.fromJson(map);
                      BoxHandler.characterBox.put(char.id, char);
                    }
                    widget.update();
                  }
                }
              },
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: SettingsButton(
              buttonText: S.of(context).settingsExportData,
              onTap: () async{
                var status = await Permission.storage.status;
                if (!status.isGranted) {
                  await Permission.storage.request();
                }
                var directory = await getApplicationDocumentsDirectory();
                if (Platform.isAndroid) {
                  directory = Directory("/storage/emulated/0/Download");
                }
                DateTime now = DateTime.now();
                String fileName = "export_${now.year}_${now.month}_${now.day}_${now.hour}_${now.minute}_${now.second}.json";
                final File outputFile = File('${directory.path}/$fileName');
                Map<String, dynamic> export = {};
                export["spells"] = BoxHandler.spellBox.values.toList();
                export["characters"] = BoxHandler.characterBox.values.toList();
                await outputFile.writeAsString(jsonEncode(export));

                if(await outputFile.exists()) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text(s.settingsExportMessageSuccess),
                      action: SnackBarAction(label: s.uiOK,
                          onPressed: scaffold.hideCurrentSnackBar),
                    ),
                  );
                }
                else{
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text(s.settingsExportMessageFail),
                      action: SnackBarAction(label: s.uiOK,
                          onPressed: scaffold.hideCurrentSnackBar),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: SettingsButton(
              buttonText: S.of(context).settingsDeleteData,
              onTap: () async{
                bool dialogRet = await FileDialog(
                  title: S.of(context).settingsDeleteData,
                  text: S.of(context).settingsDeleteMessage,
                  showCheckBox: false,
                ).openDialog(context);
                if(dialogRet){
                  Settings.deleteAll();
                  BoxHandler.delete();
                  widget.update();
                }
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
