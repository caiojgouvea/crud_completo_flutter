import 'package:controle_de_pedidos_dois/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:controle_de_pedidos_dois/models/pedido.dart';

class PedidoTile extends StatelessWidget {
  final Pedido pedido;
  const PedidoTile(this.pedido);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide()),
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text(
          'Pedido:${pedido.id}',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            'Cliente:${pedido.nomeCliente}\nValor Total: ${pedido.valorTotalPedido}',
            style: TextStyle(fontWeight: FontWeight.w900)),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.PEDIDO_FORM, arguments: pedido);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
