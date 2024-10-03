import 'package:dnd_beyonder/data/gui/constants.dart';
import 'package:dnd_beyonder/data/spell/distanceType.dart';
import 'package:dnd_beyonder/gui/Widgets/flipSwitchWidget.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../permanentData/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function update;
  const SettingsScreen({super.key, required this.update});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _langController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 10,),
          const Divider(),
          const SizedBox(height: 10,),
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
        ],
      ),
    );
  }
}
