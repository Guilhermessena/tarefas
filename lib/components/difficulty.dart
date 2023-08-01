import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int dificuldade;
  const Difficulty({required this.dificuldade, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: dificuldade >= 1 ? Colors.blue : Colors.blue[100],
          size: 16,
        ),
        Icon(
          Icons.star,
          color: dificuldade >= 2 ? Colors.blue : Colors.blue[100],
          size: 16,
        ),
        Icon(
          Icons.star,
          color: dificuldade >= 3 ? Colors.blue : Colors.blue[100],
          size: 16,
        ),
        Icon(
          Icons.star,
          color: dificuldade >= 4 ? Colors.blue : Colors.blue[100],
          size: 16,
        ),
        Icon(
          Icons.star,
          color: dificuldade == 5 ? Colors.blue : Colors.blue[100],
          size: 16,
        ),
      ],
    );
  }
}
