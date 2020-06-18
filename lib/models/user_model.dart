import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final DateTime dataHora;
  final String avatarUrl;
  final bool ativo;

  const User(
      {this.id,
      @required this.name,
      @required this.email,
      @required this.dataHora,
      @required this.avatarUrl,
      @required this.ativo});

}