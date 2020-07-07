import 'package:flutter/material.dart';

class Atleta {
  String id;
  String name;
  String modalidade;
  String avatarUrl;

  Atleta({
    this.id,
    @required this.name,
    @required this.modalidade,
    @required this.avatarUrl,
  });

  Atleta.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    modalidade = json['modalidade'];
    avatarUrl = json['avatarUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['modalidade'] = this.modalidade;
    data['avatarUrl'] = this.avatarUrl;
    return data;
  }
}
