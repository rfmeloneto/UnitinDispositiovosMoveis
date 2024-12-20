import 'package:flutter/material.dart';

class ExemploAspectRatio extends StatelessWidget {
  const ExemploAspectRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Exemplo de AspectRatio")),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(color: Colors.red),
        ),
      ),
    );
  }
}
