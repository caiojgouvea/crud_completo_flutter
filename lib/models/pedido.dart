import 'package:controle_de_pedidos_dois/models/item_pedido.dart';
import 'package:flutter/material.dart';

class Pedido {
  String id;
  double valorTotal;
  String nomeCliente;
  String dataPedido;
  List<ItemPedido> items;

  Pedido(
      {this.id,
      this.valorTotal,
      @required this.nomeCliente,
      @required this.dataPedido,
      this.items});

  double get valorTotalPedido {
    double valor = 0;
    if (items != null) {
      valor = items
          .map((e) => e.quantidade * e.produto.valor)
          .reduce((i, f) => i + f);
    } else
      valor = this.valorTotal;
    return valor;
  }
}
