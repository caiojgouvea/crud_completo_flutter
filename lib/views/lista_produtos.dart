import 'package:flutter/material.dart';
import 'package:controle_de_pedidos_dois/providers/produtos_provider.dart';
import 'package:controle_de_pedidos_dois/widgets/produtoTile.dart';
import 'package:provider/provider.dart';
import 'package:controle_de_pedidos_dois/routes/app_routes.dart';

class ProdutosLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Produtos produtos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUTO_FORM);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: produtos.count,
        itemBuilder: (context, i) => ProdutoTile(produtos.byIndex(i)),
      ),
    );
  }
}
