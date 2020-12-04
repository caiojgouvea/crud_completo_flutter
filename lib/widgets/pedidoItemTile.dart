import 'package:controle_de_pedidos_dois/models/item_pedido.dart';
import 'package:flutter/material.dart';

class PedidoItemTile extends StatelessWidget {
  final ItemPedido pedidoItem;
  const PedidoItemTile(this.pedidoItem);

  @override
  Widget build(BuildContext context) {
    final produtoImagen = (pedidoItem.produto.urlImage == null ||
            pedidoItem.produto.urlImage.isEmpty)
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(pedidoItem.produto.urlImage));
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide()),
      ),
      child: ListTile(
        leading: produtoImagen,
        title: Text(pedidoItem.produto.nome),
        subtitle: Text(
            'Qtde: ${pedidoItem.quantidade}\nValor: ${pedidoItem.valorItem}'),
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Excluir Produto'),
                      content: Text('Confirma Exclusão?'),
                      actions: [
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Sim'),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Não'),
                        ),
                      ],
                    ),
                  ).then((value) {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
