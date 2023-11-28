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
                        _showPaymentOptions(context);
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

void _showPaymentOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Credit Card'),
              onTap: () {
                // Handle credit card payment
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Debit Card'),
              onTap: () {
                // Handle debit card payment
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Bank Transfer'),
              onTap: () {
                // Handle bank transfer payment
                Navigator.pop(context);
              },
            ),
            // Add more payment options as needed
          ],
        ),
      );
    },
  );
}
