import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ifsports/data/dummy_atletas.dart';
import 'package:ifsports/classes/atleta.dart';

class AtletasProvider with ChangeNotifier {
  Map<String, Atleta> _items = {...DUMMY_ATLETAS};

  List<Atleta> get all {
    return [..._items.values];
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
    notifyListeners();
  }

  void remove(Atleta atleta) {
    if(atleta != null && atleta.id != null) {
      _items.remove(atleta.id);
      notifyListeners();
    }
  }

}

