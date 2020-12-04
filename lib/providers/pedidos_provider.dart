import 'package:controle_de_pedidos_dois/data/pedidosCadastrados.dart';
import 'package:controle_de_pedidos_dois/models/pedido.dart';
import 'package:flutter/material.dart';

class Pedidos with ChangeNotifier {
  List<Pedido> _items = [...pedidos];

  List<Pedido> get all {
    return [..._items];
  }

  int get count {
    return _items.length;
  }

  Pedido byIndex(int i) {
    return _items.elementAt(i);
  }
}
