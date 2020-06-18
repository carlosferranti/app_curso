import 'package:flutter/material.dart';

class Noticias {
  final String id;
  final String name;
  final String email;
  final DateTime dataHora;
  final String avatarUrl;
  final bool ativo;

  const Noticias(
      {this.id,
      @required this.name,
      @required this.email,
      @required this.dataHora,
      @required this.avatarUrl,
      @required this.ativo});

  // const Noticias({this.id, this.name, this.email, this.dataHora, this.avatarUrl});
}
