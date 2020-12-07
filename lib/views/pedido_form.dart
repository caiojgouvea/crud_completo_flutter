import 'package:controle_de_pedidos_dois/models/item_pedido.dart';
import 'package:controle_de_pedidos_dois/models/pedido.dart';
import 'package:controle_de_pedidos_dois/models/produto.dart';
import 'package:controle_de_pedidos_dois/views/listaProdutosConsulta.dart';
import 'package:controle_de_pedidos_dois/widgets/pedidoItemTile.dart';
import 'package:flutter/material.dart';

class PedidoForm extends StatefulWidget {
  @override
  _PedidoFormState createState() => _PedidoFormState();
}

class _PedidoFormState extends State<PedidoForm> {
  final _form = GlobalKey<FormState>();
  var valorController = TextEditingController();
  var valorTotalController = TextEditingController();
  var nomeProdutoController = TextEditingController();

  Pedido _pedido = Pedido(
      valorTotal: null,
      nomeCliente: null,
      dataPedido: null,
      items: <ItemPedido>[]);
  Produto _produto = Produto(nome: '', valor: null, urlImage: '');

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

  void _carregaFormProduto(Produto produto) {
    if (_produto != null) {
      setState(() {
        valorController.text = 'R\$:${produto.valor.toString()}';
        nomeProdutoController.text = '${produto.nome}';
      });
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

  void carregarProdutoPedido() async {
    final produto = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProdutoConsulta()));
    if (produto != null) {
      _loadPedido(null, produto);
      _carregaFormProduto(produto);
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
                    Flexible(
                      child: TextFormField(
                          controller: nomeProdutoController,
                          decoration: InputDecoration(
                            labelText: 'Produto:',
                          )),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(left: 15),
                      icon: Icon(Icons.add),
                      onPressed: () {
                        carregarProdutoPedido();
                      },
                    ),
                  ],
                ),
                TextFormField(
                    controller: valorController,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Valor:',
                    )),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Quantidade:',
                  ),
                  onChanged: (value) {
                    if (_produto != null) {
                      setState(() {
                        String valor = value.isEmpty
                            ? '0.0'
                            : (_produto.valor * double.parse(value)).toString();
                        valorTotalController.text = 'R\$: $valor';
                      });
                    }
                  },
                ),
                TextFormField(
                    controller: valorTotalController,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Valor Total:',
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
