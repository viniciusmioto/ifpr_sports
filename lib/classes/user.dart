import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String modalidade;
  final String avatarUrl;

  const User({
    this.id,
    @required this.name,
    @required this.modalidade,
    @required this.avatarUrl,
  });
}