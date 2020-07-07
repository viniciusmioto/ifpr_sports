import 'dart:convert';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ifsports/classes/atleta.dart';

class AtletasProvider with ChangeNotifier {
  Map<String, Atleta> _items = {};

  Future<List<Atleta>> get all async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');
    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Atleta> result = decoded.map((x) => Atleta.fromJson(x)).toList();
      return result;
    }
    return null;
  }

  int get count {
    return _items.length;
  }

  Atleta byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(Atleta atleta) {
    if (Atleta == null) {
      return;
    }

    if (atleta.id != null &&
        atleta.id.trim().isNotEmpty &&
        _items.containsKey(atleta.id)) {
      _items.update(
        atleta.id,
        (_) => Atleta(
          id: atleta.id,
          name: atleta.name,
          modalidade: atleta.modalidade,
          avatarUrl: atleta.avatarUrl,
        ),
      );
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Atleta(
          id: id,
          name: atleta.name,
          modalidade: atleta.modalidade,
          avatarUrl: atleta.avatarUrl,
        ),
      );
    }
    save();
    notifyListeners();
  }

  void remove(Atleta atleta) {
    if (atleta != null && atleta.id != null) {
      _items.remove(atleta.id);
      save();
      notifyListeners();
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(_items));
  }
}
