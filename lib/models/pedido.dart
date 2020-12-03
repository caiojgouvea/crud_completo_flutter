import 'package:flutter/material.dart';

class Pedido {
  final String id;
  final double valorTotal;
  final String nomeCliente;
  final String dataPedido;

  const Pedido(
      {this.id,
      @required this.valorTotal,
      @required this.nomeCliente,
      @required this.dataPedido});
}
