import 'package:flutter/material.dart';
import 'package:controle_de_pedidos_dois/models/produto.dart';
import 'package:controle_de_pedidos_dois/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:controle_de_pedidos_dois/providers/produtos_provider.dart';

class ProdutoTile extends StatelessWidget {
  final Produto produto;
  const ProdutoTile(this.produto);

  @override
  Widget build(BuildContext context) {
    final avatar = (produto.urlImage == null || produto.urlImage.isEmpty)
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(produto.urlImage));
    return ListTile(
      leading: avatar,
      title: Text(produto.nome),
      subtitle: Text(
          'R\$:${produto.valor}\nQtde em Estoque:${produto.quantidadeEstoque}'),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUTO_FORM,
                  arguments: produto,
                );
              },
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
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Sim'),
                      ),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('Não'),
                      ),
                    ],
                  ),
                ).then((value) {
                  if (value) {
                    Provider.of<Produtos>(context, listen: false)
                        .remove(produto);
                  }
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
