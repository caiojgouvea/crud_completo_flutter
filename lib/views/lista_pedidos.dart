import 'package:controle_de_pedidos_dois/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:controle_de_pedidos_dois/providers/pedidos_provider.dart';
import 'package:controle_de_pedidos_dois/widgets/pedidoTitle.dart';

class PedidoListagem extends StatefulWidget {
  @override
  _PedidoListagemState createState() => _PedidoListagemState();
}

class _PedidoListagemState extends State<PedidoListagem> {
  @override
  Widget build(BuildContext context) {
    final Pedidos pedidos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem de Pedidos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PEDIDO_FORM);
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: pedidos.count,
        itemBuilder: (context, i) => PedidoTile(pedidos.byIndex(i)),
      ),
    );
  }
}
