import 'package:controle_de_pedidos_dois/models/produto.dart';
import 'package:flutter/material.dart';

class ProdutoConsultaTile extends StatelessWidget {
  final Produto produto;
  const ProdutoConsultaTile(this.produto);

  @override
  Widget build(BuildContext context) {
    final avatar = (produto.urlImage == null || produto.urlImage.isEmpty)
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(produto.urlImage));

    return Container(
      child: ListTile(
        leading: avatar,
        title: Text(produto.nome),
        subtitle: Text(
            'R\$:${produto.valor}\nQtde em Estoque:${produto.quantidadeEstoque}'),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.check),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop(produto);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
