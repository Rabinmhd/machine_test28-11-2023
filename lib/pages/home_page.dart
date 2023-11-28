import 'package:flutter/material.dart';
import 'package:tester/data.dart';
import 'package:tester/widgets/product_tile.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gkart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => ProductTile(
                      productImage: phones[index]['picPath'],
                      price: phones[index]['price'],
                      productName: phones[index]['name']),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: phones.length),
            )
          ],
        ),
      ),
    );
  }
}
