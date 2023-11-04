import 'package:flutter/material.dart';

class CircleNumber extends StatelessWidget {
  const CircleNumber(
      {super.key, required this.number, required this.checkWrongAnswer});

  final String number;
  final bool checkWrongAnswer;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: checkWrongAnswer
          ? const Color.fromARGB(255, 111, 24, 24)
          : Colors.green[900],
      radius: 20,
      child: Text(number),
    );
  }
}
