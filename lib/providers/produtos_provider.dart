import 'dart:math';

import 'package:controle_de_pedidos_dois/data/produtosCadastrados.dart';
import 'package:controle_de_pedidos_dois/models/produto.dart';
import 'package:flutter/material.dart';

class Produtos with ChangeNotifier {
  Map<String, Produto> _items = {...PRODUTOS};

  List<Produto> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Produto byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Produto produto) {
    if (produto == null) return;

    if (produto.id != null &&
        produto.id.trim().isNotEmpty &&
        _items.containsKey(produto.id)) {
      _items.update(produto.id, (_) => produto);
    } else {
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => Produto(
              id: id,
              nome: produto.nome,
              valor: produto.valor,
              quantidadeEstoque: produto.quantidadeEstoque,
              urlImage: produto.urlImage));
    }
    notifyListeners();
  }

  void remove(Produto produto) {
    if (produto != null && produto.id != null) {
      _items.remove(produto.id);
    }
    notifyListeners();
  }
}
