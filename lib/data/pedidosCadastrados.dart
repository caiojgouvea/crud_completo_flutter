import 'package:controle_de_pedidos_dois/data/itemPedidoCadastrados.dart';
import 'package:controle_de_pedidos_dois/models/pedido.dart';

List<Pedido> pedidos = [
  Pedido(
    id: '1',
    nomeCliente: 'Jorge Arão',
    dataPedido: '01-12-2020',
    items: itensPedido,
  ),
  Pedido(
    id: '2',
    nomeCliente: 'Maria Lurdes',
    dataPedido: '04-12-2020',
  ),
  Pedido(
    id: '3',
    nomeCliente: 'Alvino Cruz',
    dataPedido: '07-12-2020',
  ),
];
