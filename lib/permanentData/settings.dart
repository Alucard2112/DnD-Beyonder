import 'dart:ui';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tavern_tome/data/spell/distanceType.dart';
import 'package:tavern_tome/generated/l10n.dart';

class Settings{
  final locals = S.delegate.supportedLocales;
  static Locale? locale;
  static bool? show5eMessage;
  static bool? showAppMessage;
  static DistanceType? distanceType;
  static SharedPreferences? _prefs;
  static PackageInfo? packageInfo;

  static const String _localSave = "locale";
  static const String _distanceSave = "distanceType";
  static const String _5eMessage = "5eMessage";
  static const String _appMessage = "appMessage";

  static Future<void> loadPreferences() async {
    S.current;
    _prefs = await SharedPreferences.getInstance();
    packageInfo = await PackageInfo.fromPlatform();
    String localeCode = _prefs!.getString(_localSave) ?? "en";
    locale = Locale(localeCode);
    show5eMessage = _prefs!.getBool(_5eMessage) ?? true;
    showAppMessage = _prefs!.getBool(_appMessage) ?? true;
    distanceType = DistanceType.values[_prefs!.getInt(_distanceSave) ?? 1];
  }

  static deleteAll(){
    _prefs!.clear();
  }

  static savePreferences(){
    _prefs!.setString(_localSave, locale!.languageCode);
    _prefs!.setInt(_distanceSave, distanceType!.index);
    _prefs!.setBool(_5eMessage, show5eMessage!);
    _prefs!.setBool(_appMessage, showAppMessage!);
  }

}