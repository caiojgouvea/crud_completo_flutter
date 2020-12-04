import 'package:controle_de_pedidos_dois/models/item_pedido.dart';
import 'package:controle_de_pedidos_dois/models/pedido.dart';
import 'package:controle_de_pedidos_dois/models/produto.dart';

List<ItemPedido> itensPedido = [
  ItemPedido(
    id: '1',
    pedido: Pedido(
      id: '2',
      nomeCliente: 'Maria Lurdes',
      valorTotal: 993,
      dataPedido: '04-12-2020',
    ),
    produto: Produto(
        id: '1',
        nome: 'Mouse',
        valor: 10.0,
        quantidadeEstoque: '52',
        urlImage:
            'https://www.logitechstore.com.br/media/catalog/product/cache/1/image/300x/9df78eab33525d08d6e5fb8d27136e95/h/i/high_resolution_png-g203-lightsync-gaming-mouse-fob---white_1.png'),
    quantidade: 13,
  ),
  ItemPedido(
    id: '2',
    pedido: Pedido(
      id: '2',
      nomeCliente: 'Maria Lurdes',
      valorTotal: 993,
      dataPedido: '04-12-2020',
    ),
    produto: Produto(
        id: '2',
        nome: 'Fone',
        valor: 31.0,
        quantidadeEstoque: '35',
        urlImage:
            'https://img2.gratispng.com/20180909/wir/kisspng-headphones-microphone-portable-network-graphics-he-headset-transparent-png-clip-art-image-gallery-yop-5b95e1a7b48370.0275816315365492877394.jpg'),
    quantidade: 13,
  ),
];
