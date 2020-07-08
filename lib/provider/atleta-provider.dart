import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ifsports/classes/atleta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AtletasProvider with ChangeNotifier {
  var _athletas = new List<Atleta>();
  SharedPreferences _prefs;

  AtletasProvider() {
    _loadFromPrefs();
  }

  Future<List<Atleta>> get all async {
    return [..._athletas];
  }

  int get count {
    return _athletas.length;
  }

  Atleta byIndex(int index) {
    return _athletas.elementAt(index);
  }

  void put(Atleta atleta) {
    if (Atleta == null) {
      return;
    }

    if (atleta.id != null && atleta.id.trim().isNotEmpty) {
      _athletas.add(
        Atleta(
          id: atleta.id,
          name: atleta.name,
          modalidade: atleta.modalidade,
          avatarUrl: atleta.avatarUrl,
        ),
      );
    }
    _saveToPrefs();
    _loadFromPrefs();
    notifyListeners();
  }

  void remove(Atleta atleta) {
    if (atleta.id != null) {
      _athletas.remove(atleta);
      _saveToPrefs();
      _loadFromPrefs();
      notifyListeners();
    }
  }

  _initPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future _loadFromPrefs() async {
    await _initPrefs();
    var data = _prefs.getString('data');
    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Atleta> result = decoded.map((x) => Atleta.fromJson(x)).toList();
      _athletas = result;
    }
  }

  Future _saveToPrefs() async {
    await _prefs.setString('data', jsonEncode(_athletas));
  }
}
