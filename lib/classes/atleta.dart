import 'package:flutter/material.dart';

class Atleta {
  final String id;
  final String name;
  final String modalidade;
  final String avatarUrl;

  const Atleta({
    this.id,
    @required this.name,
    @required this.modalidade,
    @required this.avatarUrl,
  });
}