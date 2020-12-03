import 'package:controle_de_pedidos_dois/views/lista_produtos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:controle_de_pedidos_dois/providers/produtos_provider.dart';
import 'package:controle_de_pedidos_dois/routes/app_routes.dart';
import 'package:controle_de_pedidos_dois/views/produto_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Produtos(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        routes: {
          AppRoutes.HOME: (_) => ProdutosLista(),
          AppRoutes.PRODUTO_FORM: (_) => ProdutoForm()
        },
      ),
    );
  }
}