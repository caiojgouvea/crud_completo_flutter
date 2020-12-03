import 'package:flutter/material.dart';
import 'package:controle_de_pedidos_dois/routes/app_routes.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Card(
              color: Colors.purple,
              child: InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.PRODUTO_LISTAGEM),
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text('Produtos',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.purple,
              child: InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(AppRoutes.PEDIDO_LISTAGEM),
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.format_list_numbered,
                        size: 50,
                        color: Colors.white,
                      ),
                      Text('Pedidos',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
