import 'package:flutter/material.dart';

class CircleWithNumber extends StatelessWidget {
  final int number;
  final double size;

  const CircleWithNumber({super.key, required this.number, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        number.toString(),
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
