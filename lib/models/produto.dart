import 'package:flutter/material.dart';

class Produto {
  final String id;
  final String nome;
  final double valor;
  final String urlImage;

  const Produto(
      {this.id,
      @required this.nome,
      @required this.valor,
      @required this.urlImage});
}
