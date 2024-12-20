import 'package:flutter/material.dart';

class ExemploFlexible extends StatelessWidget {
  const ExemploFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exemplo de Flexible")),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(color: Colors.green),
          ),
          Flexible(
            flex: 1,
            child: Container(color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
