import 'package:flutter/material.dart';
import 'package:petshop_mobile/widgets/left_drawer.dart';
import 'package:petshop_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Colors.blue[200]!, Icons.list),
    ItemHomepage("Tambah Produk", Colors.purple[200]!, Icons.add),
    ItemHomepage("Logout", Colors.red[400]!, Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raisa Pet Shop',
          style: TextStyle(
            fontFamily: 'Chango',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue[900],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        shrinkWrap: true,
        children: items.map((ItemHomepage item) {
          return ItemCard(item);
        }).toList(),
      ),
      backgroundColor: Colors.amber[50],
      drawer: const LeftDrawer(),
    );
  }
}


