import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ifsports/classes/atleta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AtletasProvider with ChangeNotifier {
  var _athletas = List<Atleta>();
  var _athletasFilter = List<Atleta>();
  SharedPreferences _prefs;

  AtletasProvider() {
    _loadFromPrefs();
  }

  Future<List<Atleta>> get all async {
    _loadFromPrefs();
    return _athletas;
  }

  int get count {
    _loadFromPrefs();
    return _athletas.length;
  }

  int get countFilter {
    _loadFromPrefs();
    return _athletasFilter.length;
  }

  Atleta byIndex(int index) {
    return _athletas.elementAt(index);
  }

  Atleta byIndexFilter(int index, String string) {
    _athletasFilter = _athletas
        .where((e) => (e.name.toLowerCase().contains(string.toLowerCase())))
        .toList();

    return _athletasFilter.isNotEmpty
        ? _athletasFilter.elementAt(index)
        : _athletas.elementAt(index);
  }

  int byAtleta(Atleta atleta) {
    return _athletas.indexOf(atleta);
  }

  void put(Atleta atleta) {
    if (Atleta == null) {
      return;
    }

    if (atleta.id != null && atleta.id.trim().isNotEmpty) {
      _athletas.add(
        Atleta(
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

  void removeAt(int index) {
    if (index != null) {
      _athletas.removeAt(index);
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
