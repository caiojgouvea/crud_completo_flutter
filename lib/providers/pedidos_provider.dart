import 'dart:io';
import 'package:controle_de_pedidos_dois/data/pedidosCadastrados.dart';
import 'package:controle_de_pedidos_dois/models/pedido.dart';
import 'package:flutter/material.dart';

class Pedidos with ChangeNotifier {
  Map<String, Pedido> _items = {...PEDIDOS};

  List<Pedido> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Pedido byIndex(int i) {
    return _items.values.elementAt(i);
  }
}
