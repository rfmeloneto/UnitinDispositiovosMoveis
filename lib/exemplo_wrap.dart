import 'package:flutter/material.dart';

class ExemploWrap extends StatelessWidget {
  const ExemploWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exemplo de Wrap")),
      body: Center(
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            10,
            (index) => Container(
              width: 100,
              height: 100,
              color: Colors.primaries[index % Colors.primaries.length],
              child: Center(child: Text("Item $index")),
            ),
          ),
        ),
      ),
    );
  }
}
