import 'package:flutter/material.dart';
import 'package:tester/pages/phone_details.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  String productName;
  String productImage;
  double price;
  ProductTile({
    super.key,
    required this.productName,
    required this.productImage,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    // print(screen);
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhoneDetails(
            price: price,
            productImage: productImage,
            productName: productName,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          children: [
            SizedBox(
              width: screen.width * .3,
              height: screen.height * .2,
              child: Image.asset(
                productImage,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold)),
                const Row(
                  children: [
                    Icon(Icons.star),
                    Text("4.5"),
                  ],
                ),
                Text(
                  "Price : $price",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text("Free delivery by Tomorrow"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
