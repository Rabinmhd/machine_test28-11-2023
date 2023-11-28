// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:tester/data.dart';
import 'package:tester/widgets/button.dart';
import 'package:tester/widgets/product_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: screen.height * .82,
              child: ListView.separated(
                  itemBuilder: (context, index) => ProductTile(
                      productName: cartPhones[index]["name"],
                      productImage: cartPhones[index]["picPath"],
                      price: cartPhones[index]["price"]),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: cartPhones.length),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Total : $totalAmount",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  InkWell(
                      onTap: () {
                        //  startPayment;
                      },
                      child: ButtonWidget(content: "Pay and purchase")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
