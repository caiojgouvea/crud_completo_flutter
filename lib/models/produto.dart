import 'package:flutter/material.dart';

class Produto {
  String id;
  String nome;
  double valor;
  String urlImage;
  String quantidadeEstoque;

  Produto(
      {this.id,
      this.quantidadeEstoque,
      @required this.nome,
      @required this.valor,
      @required this.urlImage});
}
