import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dnd_beyonder/data/spell/distanceType.dart';
import 'package:dnd_beyonder/generated/l10n.dart';

class Settings{
  final locals = S.delegate.supportedLocales;
  static Locale? locale;
  static DistanceType? distanceType;
  static SharedPreferences? _prefs;

  static const String _localSave = "locale";
  static const String _distanceSave = "distanceType";

  static Future<void> loadPreferences() async {
    S.current;
    _prefs = await SharedPreferences.getInstance();
    String localeCode = _prefs!.getString(_localSave) ?? "en";
    locale = Locale(localeCode);
    distanceType = DistanceType.values[_prefs!.getInt(_distanceSave) ?? 1];
  }


  static savePreferences(){
    _prefs!.setString(_localSave, locale!.languageCode);
    _prefs!.setInt(_distanceSave, distanceType!.index);
  }

}