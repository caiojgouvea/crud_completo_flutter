import 'package:controle_de_pedidos_dois/providers/produtos_provider.dart';
import 'package:controle_de_pedidos_dois/routes/app_routes.dart';
import 'package:controle_de_pedidos_dois/widgets/produtoConsultaTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProdutoConsulta extends StatelessWidget {
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
        padding: EdgeInsets.all(10.0),
        itemCount: produtos.count,
        itemBuilder: (context, i) => ProdutoConsultaTile(produtos.byIndex(i)),
      ),
    );
  }
}
