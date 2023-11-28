// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:tester/data.dart';
import 'package:tester/pages/cart.dart';
import 'package:tester/widgets/button.dart';
import 'package:tester/widgets/product_tile.dart';

// ignore: must_be_immutable
class PhoneDetails extends StatelessWidget {
  String productImage;
  double price;
  String productName;

  PhoneDetails({
    super.key,
    required this.productName,
    required this.productImage,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gkart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: screen.height * .4,
                    width: screen.width * .6,
                    child: Image.asset(productImage)),
              ],
            ),
            Text(productName,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            const Row(
              children: [
                Icon(Icons.star),
                Text("4.5"),
              ],
            ),
            Text(
              "Price : $price",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text("Free delivery by Tomorrow"),
            SizedBox(
              height: screen.height * .3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductTile(
                      productImage: phones[index]['picPath'],
                      price: phones[index]['price'],
                      productName: phones[index]['name']),
                  itemCount: phones.length),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    onTap: () {
                      cartPhones.add({
                        'name': productName,
                        'price': price,
                        'picPath': productImage,
                      });
                      totalAmount = totalAmount + price;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                    child: ButtonWidget(content: "Add to cart")),
                InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartPage(),
                          ),
                        ),
                    child: ButtonWidget(content: "Go to cart")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
