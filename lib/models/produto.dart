import 'package:flutter/material.dart';

class Produto {
  final String id;
  final String nome;
  final double valor;
  final String urlImage;
  final String quantidadeEstoque;

  const Produto(
      {this.id,
      this.quantidadeEstoque,
      @required this.nome,
      @required this.valor,
      @required this.urlImage});
}
