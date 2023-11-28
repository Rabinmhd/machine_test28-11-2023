import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  String content;

  ButtonWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber,
      ),
      height: screen.height * .07,
      width: screen.width * .4,
      child: Center(
          child: Text(
        content,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
