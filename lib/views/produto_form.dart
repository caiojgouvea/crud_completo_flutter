import 'package:controle_de_pedidos_dois/models/produto.dart';
import 'package:flutter/material.dart';
import 'package:controle_de_pedidos_dois/providers/produtos_provider.dart';
import 'package:provider/provider.dart';

class ProdutoForm extends StatefulWidget {
  @override
  _ProdutoFormState createState() => _ProdutoFormState();
}

class _ProdutoFormState extends State<ProdutoForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Produto produto) {
    if (produto != null) {
      _formData['id'] = produto.id;
      _formData['nome'] = produto.nome;
      _formData['valor'] = produto.valor.toString();
      _formData['imageUrl'] = produto.urlImage;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Produto produto = ModalRoute.of(context).settings.arguments;
    _loadFormData(produto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produto'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();
                Provider.of<Produtos>(context, listen: false).put(
                  Produto(
                    id: _formData['id'],
                    nome: _formData['nome'],
                    valor: double.parse(_formData['valor']),
                    urlImage: _formData['imageUrl'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome:'),
                validator: (value) {
                  if (value == null) {
                    return 'Nome inválido!';
                  }
                  return null;
                },
                onSaved: (value) => _formData['nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['valor'],
                decoration: InputDecoration(labelText: 'Valor:'),
                onSaved: (value) => _formData['valor'] = value,
              ),
              TextFormField(
                initialValue: _formData['imageUrl'],
                decoration: InputDecoration(labelText: 'Imagem:'),
                onSaved: (value) => _formData['imageUrl'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
