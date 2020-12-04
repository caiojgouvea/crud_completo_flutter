import 'package:flutter/material.dart';

Widget navBarInferor(int index) {
  return BottomNavigationBar(
    currentIndex: index,
    backgroundColor: Colors.purple,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.black,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.format_list_numbered),
        label: 'Pedidos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        label: 'Produtos',
      ),
    ],
  );
}
