import 'package:flutter/material.dart';
import 'package:controle_de_pedidos_dois/models/pedido.dart';

class PedidoTile extends StatelessWidget {
  final Pedido pedido;
  const PedidoTile(this.pedido);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.list),
      title: Text(pedido.nomeCliente),
      subtitle: Text(
          'Cliente:${pedido.nomeCliente}\nValor Total: ${pedido.valorTotal}'),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
