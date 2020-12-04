import 'package:controle_de_pedidos_dois/data/itemPedidoCadastrados.dart';
import 'package:controle_de_pedidos_dois/models/item_pedido.dart';
import 'package:flutter/material.dart';

class ItemsPedido with ChangeNotifier {
  List<ItemPedido> _items = [...itensPedido];

  List<ItemPedido> get all {
    return [..._items];
  }

  int get count {
    return _items.length;
  }

  ItemPedido byIndex(int i) {
    return _items.elementAt(i);
  }
}
