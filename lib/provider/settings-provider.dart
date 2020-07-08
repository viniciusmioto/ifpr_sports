import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeChanger extends ChangeNotifier {
  bool _darkStatus = false;
  final String key = 'theme';
  SharedPreferences _prefs;

  ThemeChanger() {
    _darkStatus = false;
    _loadFromPrefs();
  }

  isDark() => _darkStatus;

  setDarkStatus(bool status) {
    _darkStatus = status;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkStatus = _prefs.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkStatus);
  }
}
