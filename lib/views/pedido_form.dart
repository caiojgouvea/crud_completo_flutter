import 'package:controle_de_pedidos_dois/models/item_pedido.dart';
import 'package:controle_de_pedidos_dois/models/pedido.dart';
import 'package:controle_de_pedidos_dois/models/produto.dart';
import 'package:controle_de_pedidos_dois/routes/app_routes.dart';
import 'package:controle_de_pedidos_dois/widgets/pedidoItemTile.dart';
import 'package:flutter/material.dart';

class PedidoForm extends StatefulWidget {
  @override
  _PedidoFormState createState() => _PedidoFormState();
}

class _PedidoFormState extends State<PedidoForm> {
  final _form = GlobalKey<FormState>();
  Pedido _pedido = Pedido(
      valorTotal: null,
      nomeCliente: null,
      dataPedido: null,
      items: <ItemPedido>[]);
  Produto _produto = Produto(nome: null, valor: null, urlImage: null);

  void _loadPedido(Pedido pedidoRecebido, Produto produtoRecebido) {
    if (pedidoRecebido != null) {
      _pedido.id = pedidoRecebido.id;
      _pedido.items =
          pedidoRecebido.items == null ? <ItemPedido>[] : pedidoRecebido.items;
      _pedido.valorTotal = pedidoRecebido.valorTotal;
    } else if (produtoRecebido != null) {
      _produto = produtoRecebido;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context).settings.toString().contains('Pedido')) {
      final Pedido pedido = ModalRoute.of(context).settings.arguments;
      _loadPedido(pedido, null);
    } else if (ModalRoute.of(context).settings.toString().contains('Produto')) {
      final Produto produto = ModalRoute.of(context).settings.arguments;
      _loadPedido(null, produto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Pedido'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: _form,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Produto:'),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.PRODUTO_CONSULTA);
                      },
                    )
                  ],
                ),
                TextFormField(
                    decoration: InputDecoration(
                  labelText: 'Quantidade:',
                )),
                TextFormField(
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Valor:',
                    )),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    child: Text('Adicionar'),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: _pedido.items.length,
                    itemBuilder: (context, i) =>
                        PedidoItemTile(_pedido.items.elementAt(i)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
