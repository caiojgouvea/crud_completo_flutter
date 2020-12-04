import 'package:controle_de_pedidos_dois/models/pedido.dart';
import 'package:controle_de_pedidos_dois/models/produto.dart';

import 'package:flutter/material.dart';

class ItemPedido {
  final String id;
  final Produto produto;
  final Pedido pedido;
  final int quantidade;

  const ItemPedido(
      {this.id,
      @required this.produto,
      @required this.pedido,
      @required this.quantidade});

  double get valorItem {
    return this.produto.valor * this.quantidade;
  }
}
